output "web_server" {
  description = "The security group for web servers"
  value       = aws_security_group.web_server
}
output "ansible" {
  description = "The security group for ansible server"
  value       = aws_security_group.ansible
}
output "jenkins" {
  description = "The security group for jenkins server"
  value       = aws_security_group.jenkins
}
