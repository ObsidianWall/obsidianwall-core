
#filepath: modules/aws-s3/versions.tf

# This file specifies the required Terraform version and provider versions for the AWS S3 module.


terraform {
  required_version = ">= 1.6.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
