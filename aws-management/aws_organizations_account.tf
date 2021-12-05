resource "aws_organizations_account" "management" {
  provider = aws.management
  name     = "Management"
  email    = "tqer39+aws-management@gmail.com"
}

resource "aws_organizations_account" "audit" {
  provider  = aws.management
  name      = "Audit"
  email     = "tqer39+aws-audit@gmail.com"
  parent_id = aws_organizations_organizational_unit.security.id
  depends_on = [
    aws_organizations_organizational_unit.security
  ]
}

resource "aws_organizations_account" "log" {
  provider  = aws.management
  name      = "Log Archive"
  email     = "tqer39+aws-log@gmail.com"
  parent_id = aws_organizations_organizational_unit.security.id
  depends_on = [
    aws_organizations_organizational_unit.security
  ]
}

resource "aws_organizations_account" "sandbox" {
  provider  = aws.management
  name      = "Sandbox"
  email     = "tqer39+aws-sandbox@gmail.com"
  parent_id = aws_organizations_organizational_unit.sandbox.id
  depends_on = [
    aws_organizations_organizational_unit.sandbox
  ]
}

resource "aws_organizations_account" "portfolio_dev" {
  provider  = aws.management
  name      = "Portfolio - dev"
  email     = "tqer39+aws-portfolio-dev@gmail.com"
  parent_id = aws_organizations_organizational_unit.workload.id
  depends_on = [
    aws_organizations_organizational_unit.workload
  ]
}
