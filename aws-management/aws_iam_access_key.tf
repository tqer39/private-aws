resource "aws_iam_access_key" "terraform" {
  provider = aws.management
  user     = aws_iam_user.terraform.name
  pgp_key  = var.PGP_KEY
  depends_on = [
    aws_iam_user.terraform,
  ]
}