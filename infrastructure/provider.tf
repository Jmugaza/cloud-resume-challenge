terraform {
  required_providers {
    aws = {
      version =">=4.9.0"
      source  = "hashicorp/aws"
      
    }
  }
}


# Define the AWS provider
provider "aws" {
  profile = "jeilani"
  region = "us-east-1"
}
