resource "aws_guardduty_detector" "private_aws" {
  provider = aws.management
  enable   = true
}
