output "ansible_instance_profile" {
  description = "AWS instance profile for Ansible server"
  value       = aws_iam_instance_profile.ansible_profile
}
