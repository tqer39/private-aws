resource "aws_guardduty_detector" "private_aws" {
  provider = aws.audit
  enable   = true
}
