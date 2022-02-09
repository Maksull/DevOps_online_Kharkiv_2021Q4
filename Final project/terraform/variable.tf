variable "aws_region" {
  description = "The aws region"
  type        = string
  default     = "eu-north-1"
}

variable "amazon_ami_owner" {
  description = "The value of owner of amazon ami"
  type        = list(string)
  default     = ["137112412989"]
}
variable "amazon_ami_latest" {
  description = "Is the latest version of ami"
  type        = bool
  default     = true
}

variable "web_server_allowed_ports" {
  description = "The ports are allowed in web server"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "ansible_allowed_ports" {
  description = "The ports are allowed in Ansible server"
  type        = list(number)
  default     = [22]
}

variable "jenkins_allowed_ports" {
  description = "The ports are allowed in Jenkins server"
  type        = list(number)
  default     = [22, 8080]
}

variable "common_tags" {
  description = "The tags every resource has"
  type        = map(any)
  default = {
    "Author"  = "Maksym Yuhov",
    "Project" = "EPAM Final project"
  }
}

variable "web_server_instance_type" {
  description = "The instance type web server has"
  type        = string
  default     = "t3.micro"
}
