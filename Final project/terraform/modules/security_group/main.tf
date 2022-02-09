resource "aws_security_group" "web_server" {
  name = "Web server security group"
  dynamic "ingress" {
    for_each = var.web_server_allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.common_tags, {
    "Name" = "Web server security group"
  })
}

resource "aws_security_group" "ansible" {
  name = "Ansible security group"
  dynamic "ingress" {
    for_each = var.ansible_allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.common_tags, {
    "Name" = "Ansible security group"
  })
}

resource "aws_security_group" "jenkins" {
  name = "Jenkins security group"
  dynamic "ingress" {
    for_each = var.jenkins_allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.common_tags, {
    "Name" = "Jenkins seucrity group"
  })
}
