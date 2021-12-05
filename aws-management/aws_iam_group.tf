resource "aws_iam_group" "terraform" {
  provider = aws.management
  name     = "terraform"
}