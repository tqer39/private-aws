resource "aws_iam_group_policy_attachment" "terraform" {
  provider   = aws.management
  group      = aws_iam_group.terraform.name
  policy_arn = aws_iam_policy.terraform.arn
  depends_on = [
    aws_iam_policy.terraform,
    aws_iam_group.terraform
  ]
}

# AWS Toolkit を使用するために直接権限を付与しないといけない。
# AWS CLI の Credentials に IAM Role を設定してもダメ。
resource "aws_iam_group_policy_attachment" "terraform_AdministratorAccess" {
  provider   = aws.management
  group      = aws_iam_group.terraform.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  depends_on = [
    aws_iam_policy.terraform,
    aws_iam_group.terraform
  ]
}