terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "richard"

    workspaces {
      name = "terraform-associate-lab"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "test-"
  tags = {
    "Name" = "test"
  }
}