provider "aws" {
  access_key = "AKIA44O4ISZISKSB6F2S"
  secret_key = "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"
  region     = var.aws_region
}

terraform {
  required_version = ">= 1.1.3"
}

#====================DATA====================

data "aws_ami" "amazon_latest" {
  owners      = var.amazon_ami_owner
  most_recent = var.amazon_ami_latest
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
  }
}

data "aws_availability_zones" "available" {}

#===========================================================


#=========================MODULES===========================

module "aws_security_groups" {
  source                   = "./modules/security_group"
  web_server_allowed_ports = var.web_server_allowed_ports
  ansible_allowed_ports    = var.ansible_allowed_ports
  jenkins_allowed_ports    = var.jenkins_allowed_ports
  common_tags              = var.common_tags
}

module "ssh_key" {
  source = "./modules/ssh_key"
}

module "iam_role" {
  source = "./modules/iam_role"
}

#===========================================================

#====================AWS_DEFAULT_SUBNET=====================

resource "aws_default_subnet" "subnet1" {
  availability_zone = data.aws_availability_zones.available.names[0]
}

resource "aws_default_subnet" "subnet2" {
  availability_zone = data.aws_availability_zones.available.names[1]
}

#===========================================================

#======================AWS_INSTANCE=========================

resource "aws_instance" "ansible" {
  ami                    = data.aws_ami.amazon_latest.id
  instance_type          = var.web_server_instance_type
  vpc_security_group_ids = [module.aws_security_groups.ansible.id]
  key_name               = module.ssh_key.ansible_connection.key_name
  iam_instance_profile   = module.iam_role.ansible_instance_profile.name
  user_data              = file("./initialize_data/ansible_user_data")
  provisioner "file" {
    source      = "../ansible"
    destination = "/home/ec2-user"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = module.ssh_key.ansible_key.content
      host        = self.public_ip
    }
  }
  provisioner "remote-exec" {
    inline = [
      "chmod 400 ~/ansible/${module.ssh_key.web_server_key.filename}",
      "chmod 400 ~/ansible/${module.ssh_key.jenkins_key.filename}"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = module.ssh_key.ansible_key.content
      host        = self.public_ip
    }
  }
  tags = merge(var.common_tags, {
    "Name"    = "Ansible server",
    "Type"    = "Ansible amazon",
    "OS_type" = "Amazon"
  })
}

resource "aws_instance" "jenkins" {
  ami                    = data.aws_ami.amazon_latest.id
  instance_type          = var.web_server_instance_type
  vpc_security_group_ids = [module.aws_security_groups.jenkins.id]
  key_name               = module.ssh_key.jenkins_connection.key_name
  tags = merge(var.common_tags, {
    "Name"    = "Jenkins master server",
    "Type"    = "Jenkins amazon",
    "OS_type" = "Amazon"

  })
}

#===========================================================


#==================AWS_AUTOSCALING_GROUP====================

resource "aws_launch_configuration" "web_server" {
  name_prefix     = "Web-Server-"
  image_id        = data.aws_ami.amazon_latest.id
  instance_type   = var.web_server_instance_type
  security_groups = [module.aws_security_groups.web_server.id]
  key_name        = module.ssh_key.web_server_connection.key_name
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_elb" "web_server" {
  name               = "Web-Server-ELB"
  availability_zones = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  security_groups    = [module.aws_security_groups.web_server.id]
  listener {
    lb_port           = 80
    lb_protocol       = "HTTP"
    instance_port     = 80
    instance_protocol = "HTTP"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 10
  }
  tags = merge(var.common_tags, {
    "Name" = "Web server ELB"
  })
}

resource "aws_autoscaling_group" "web_server" {
  name                 = "ASG-${aws_launch_configuration.web_server.name}"
  launch_configuration = aws_launch_configuration.web_server.name
  min_size             = 2
  max_size             = 2
  min_elb_capacity     = 2
  vpc_zone_identifier  = [aws_default_subnet.subnet1.id, aws_default_subnet.subnet2.id]
  health_check_type    = "ELB"
  load_balancers       = [aws_elb.web_server.name]
  dynamic "tag" {
    for_each = merge(var.common_tags, {
      "Name"    = "Web server in ASG",
      "Type"    = "Web server amazon",
      "OS_type" = "Amazon"
    })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
  lifecycle {
    create_before_destroy = true
  }
}

#===========================================================
