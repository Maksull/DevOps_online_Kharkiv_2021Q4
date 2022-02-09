variable "common_tags" {
  description = "The tags every resource has"
  type        = map(any)
}

variable "web_server_allowed_ports" {
  description = "The ports are allowed in web server"
  type        = list(number)
}

variable "ansible_allowed_ports" {
  description = "The ports are allowed in Ansible server"
  type        = list(number)
}

variable "jenkins_allowed_ports" {
  description = "The ports are allowed in Jenkins server"
  type        = list(number)
}