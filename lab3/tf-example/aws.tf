terraform {
  required_version = "> 1.4.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.67"
    }
    dockerless = {
      source = "nullstone-io/dockerless"
      version = "0.1.1"
    }

  }
}

provider "aws" {
  region                   = var.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.profile
}




