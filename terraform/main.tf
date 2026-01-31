provider "aws" {
  region  = local.region
  profile = "aws-lucas"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }
  }
  backend "s3" {
    bucket  = "descomplicando-terraform-remote-state"
    key     = "eks/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    profile = "aws-lucas"
  }
}