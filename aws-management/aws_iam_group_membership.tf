resource "aws_iam_group_membership" "terraform" {
  provider = aws.management
  name     = "terraform"
  group    = aws_iam_group.terraform.name
  users = [
    aws_iam_user.terraform.name
  ]
  depends_on = [
    aws_iam_user.terraform,
    aws_iam_group.terraform,
  ]
}