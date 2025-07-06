
# filepath: modules/ndr-aws-ec2/version.tf

# This file defines the required Terraform version and provider versions for the NDR AWS EC2 module.
# It is used to ensure that the module is compatible with the specified versions of Terraform and AWS provider.



terraform {
  required_version = ">= 1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
