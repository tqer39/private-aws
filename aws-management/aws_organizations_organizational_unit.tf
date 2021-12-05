resource "aws_organizations_organizational_unit" "sandbox" {
  provider  = aws.management
  name      = "Sandbox"
  parent_id = aws_organizations_organization.private_aws.roots[0].id
}

resource "aws_organizations_organizational_unit" "security" {
  provider  = aws.management
  name      = "Security"
  parent_id = aws_organizations_organization.private_aws.roots[0].id
}

resource "aws_organizations_organizational_unit" "workload" {
  provider  = aws.management
  name      = "WorkLoad"
  parent_id = aws_organizations_organization.private_aws.roots[0].id
}