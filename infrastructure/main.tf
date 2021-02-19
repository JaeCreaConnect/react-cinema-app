provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "app-cinema-tf-state-jae"
    key     = "app-cinema.tfstatejae"
    region  = "us-east-1"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManagedBy   = "Terraform"
    Owner       = "Jae Thomas Regan" ##team name would go here
  }
}

