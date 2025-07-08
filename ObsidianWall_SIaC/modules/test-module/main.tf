
# File: obsidianwall-core/ObsidianWall_SIaC/modules/test-module/main.tf

# This Terraform module is a simple example that uses the null provider to run a local command.



terraform {
  required_version = ">= 1.6.0"
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Hello from test-module!"
  }
}
