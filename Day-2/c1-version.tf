terraform {
  #  required_version = "~> 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.54.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}
