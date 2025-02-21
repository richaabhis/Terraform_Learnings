terraform {
    required_providers {
        aws ={
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
  region = "us-east-1"
}

# Configure the backend with S3 and DynamoDB
terraform {
  backend "s3" {
    bucket         = "tf-state-fil-storage-220225"                             # Hardcoded bucket name
    key            = "modules/tfstat/terraform.tfstate"                      # Path to the state file in the bucket
    region         = "us-east-1"                                              # Region for S3 and DynamoDB
    dynamodb_table = "tf-state-lock"                                          # Hardcoded DynamoDB table name
    encrypt        = true                                                     # Enable encryption for the state file
  }
}

module "abhishek-vpc" {
    source = "./modules/abhishek_vpc"
    cidr_block = var.cidr_block
    instance_tenancy = var.instance_tenancy
    vpc_name = var.vpc_name
}