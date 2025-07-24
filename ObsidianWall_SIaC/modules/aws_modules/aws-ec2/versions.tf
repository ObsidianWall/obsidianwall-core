
# filepath: modules/aws-ec2/versions.tf

# This file specifies the required Terraform version and provider versions for the AWS EC2 module.


terraform {
  required_version = ">= 1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
