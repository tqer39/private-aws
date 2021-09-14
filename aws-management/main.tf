terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "private-aws"
    workspaces {
      name = "aws-management"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
  default_tags {
    tags = local.common_tags
  }
}

provider "aws" {
  alias   = "management"
  region  = var.region
  profile = var.profile
  assume_role {
    role_arn = "arn:aws:iam::${var.AWS_ACCOUNT_ID_MANAGEMENT}:role/terraform"
  }
  default_tags {
    tags = local.common_tags
  }
}

locals {
  common_tags = {
    IaC              = var.IaC
    Environment      = var.Environment
    Project          = var.Project
    TFC_Organization = var.TFC_Organization
    TFC_Workspace    = var.TFC_Workspace
  }
}
