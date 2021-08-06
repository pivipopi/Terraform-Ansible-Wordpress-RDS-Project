terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.34"
    }
  }
}


provider "aws" {
  region = var.aws_region
  access_key = var.aws_akey
  secret_key = var.aws_skey
}
