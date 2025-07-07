# Configure the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#locking terrform state file to s3
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-bucker12345"
  
  lifecycle {
    prevent_destroy = false
  }
}

terraform {  
  backend "s3" {  
    bucket       = "terraform-state-bucker12345"  
    key          = "dev/terraform-state-file"  
    region       = "us-east-1"  
    encrypt      = true  
    //use_lockfile = true  #S3 native locking
  }  
}