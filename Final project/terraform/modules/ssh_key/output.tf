output "web_server_key" {
  description = "The SSH key for web sesrver"
  value       = local_file.web_server_pem
}

output "ansible_key" {
  description = "The SSH key for ansible sesrver"
  value       = local_file.ansible_pem
}

output "jenkins_key" {
  description = "The SSH key for jenkins sesrver"
  value       = local_file.jenkins_pem
}

output "web_server_connection" {
  description = "The SSH connection for web sesrver"
  value       = aws_key_pair.web_server_connection
}

output "ansible_connection" {
  description = "The SSH connection for ansible sesrver"
  value       = aws_key_pair.ansible_connection
}

output "jenkins_connection" {
  description = "The SSH connection for jenkins sesrver"
  value       = aws_key_pair.jenkins_connection
}
