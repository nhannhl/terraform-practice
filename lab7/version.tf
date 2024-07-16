terraform {
  required_version = ">= 1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-bucket-learn"
    key = "terraform-logs"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-locks"
  }
}