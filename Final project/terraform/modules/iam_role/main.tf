resource "aws_iam_policy" "ansible_policy" {
  name        = "ansible_policy"
  description = "IAM policy for Ansible server to manipulate with AWS EC2 instances"
  policy      = file("./initialize_data/ansible_policy.json")
}

resource "aws_iam_role" "ansible_role" {
  name                = "ansible_role"
  assume_role_policy  = file("./initialize_data/ansible_assume_policy.json")
  managed_policy_arns = [aws_iam_policy.ansible_policy.arn]
}

resource "aws_iam_instance_profile" "ansible_profile" {
  name = "ansible_profile"
  role = aws_iam_role.ansible_role.name
}
