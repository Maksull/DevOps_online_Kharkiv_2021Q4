output "web_loadbalancer_ip" {
  value = aws_elb.web_server.dns_name
}
output "ansible_server_ip" {
  description = "The ip of Ansible server"
  value       = aws_instance.ansible.public_ip
}
output "jenkins_server_ip" {
  description = "The ip of Jenkins server"
  value       = aws_instance.jenkins.public_ip
}
