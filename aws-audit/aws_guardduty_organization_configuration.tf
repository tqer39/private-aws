resource "aws_guardduty_organization_configuration" "private_aws" {
  provider    = aws.audit
  auto_enable = true
  detector_id = aws_guardduty_detector.private_aws.id
  datasources {
    s3_logs {
      auto_enable = true
    }
  }
  depends_on = [
    aws_guardduty_detector.private_aws,
  ]
}
