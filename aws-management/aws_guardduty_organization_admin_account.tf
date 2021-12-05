resource "aws_guardduty_organization_admin_account" "private_aws" {
  provider         = aws.management
  admin_account_id = aws_organizations_account.audit.id
  depends_on = [
    aws_organizations_organization.private_aws,
    aws_organizations_account.audit
  ]
}
