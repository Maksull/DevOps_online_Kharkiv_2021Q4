resource "tls_private_key" "ansible_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "tls_private_key" "jenkins_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "tls_private_key" "web_server_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ansible_connection" {
  key_name   = "ansible_connection"
  public_key = tls_private_key.ansible_private_key.public_key_openssh
}
resource "aws_key_pair" "jenkins_connection" {
  key_name   = "jenkins_connection"
  public_key = tls_private_key.jenkins_private_key.public_key_openssh
}
resource "aws_key_pair" "web_server_connection" {
  key_name   = "web_server_connection"
  public_key = tls_private_key.web_server_private_key.public_key_openssh
}

resource "local_file" "ansible_pem" {
  filename = "../ansible/ansible.pem"
  content  = tls_private_key.ansible_private_key.private_key_pem
}
resource "local_file" "jenkins_pem" {
  filename = "../ansible/jenkins.pem"
  content  = tls_private_key.jenkins_private_key.private_key_pem
}
resource "local_file" "web_server_pem" {
  filename = "../ansible/web_server.pem"
  content  = tls_private_key.web_server_private_key.private_key_pem
}
