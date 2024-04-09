terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
  }
  backend "s3" {
    bucket = "s3bucket-sridhar"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "state_lock_sridhar"
  }


}

provider "aws" {
  # Configuration options
}


