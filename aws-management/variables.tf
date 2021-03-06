variable "Environment" {
  description = "環境（dev | stg | prd）の種類。"
  type        = string
  default     = "prd"
}

variable "IaC" {
  description = "IaC（Infrastructure as Code）で使用したソフトウェア。"
  type        = string
  default     = "Terraform"
}

variable "TFC_Organization" {
  description = "Terraform Cloud の Organization の名前。"
  type        = string
  default     = "private-aws"
}

variable "TFC_Workspace" {
  description = "Terraform Cloud の Workspace の名前。"
  type        = string
  default     = "aws-management"
}

variable "region" {
  description = "当プロジェクトにおけるデフォルトのリージョン。"
  default     = "ap-northeast-1"
  type        = string
}

variable "PGP_KEY" {}
variable "AWS_ACCOUNT_ID" {}
variable "GITHUB_REPOSITORY_NAME" {}