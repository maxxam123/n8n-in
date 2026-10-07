provider "aws" {
  region = "eu-central-1"
}

terraform {

  backend "s3" {
    bucket = "dunhuang-gansu-terraform-state"
    key    = "global/02-aws-upstream/terraform.tfstate"
    dynamodb_table = "terraform_state"
    region = "eu-central-1"
    encrypt = true
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.6.0"
    }
  }
}
