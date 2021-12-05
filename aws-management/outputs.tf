output "organizations_account_management_id" {
  value       = aws_organizations_account.management.id
  description = "Management Account ID"
  sensitive   = true
}

output "organizations_account_sandbox_id" {
  value       = aws_organizations_account.sandbox.id
  description = "Sandbox Account ID"
  sensitive   = true
}

output "organizations_account_audit_id" {
  value       = aws_organizations_account.audit.id
  description = "Audit Account ID"
  sensitive   = true
}

output "organizations_account_log_id" {
  value       = aws_organizations_account.log.id
  description = "Log Account ID"
  sensitive   = true
}

output "organizations_account_portfolio_dev_id" {
  value       = aws_organizations_account.portfolio_dev.id
  description = "Dev Portfolio ID"
  sensitive   = true
}

output "iam_user_terraform_access_key" {
  value       = aws_iam_access_key.terraform.id
  description = "Terraform Access Key"
  sensitive   = true
}

output "iam_user_terraform_encrypted_secret" {
  value       = aws_iam_access_key.terraform.encrypted_secret
  description = "Terraform Encrypted Secret"
  sensitive   = true
}