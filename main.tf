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

module "vpc" {
    source           = "./modules/abhishek_vpc"
    cidr_block       = var.cidr_block
    instance_tenancy = var.instance_tenancy
    vpc_name         = var.vpc_name
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   =module.vpc.vpc_id
  igw_name =var.igw_name
}

module "public_subnets" {
  source                    = "./modules/public_subnet"
  vpc_id                    = module.vpc.vpc_id
  public_subnets_cidr       = var.public_subnets_cidr
  public_availability_zones = var.public_availability_zones
  map_public_ip_on_launch   = var.map_public_ip_on_launch
}

module "public_route_table" {
  source = "./modules/public_route_table"
  vpc_id= module.vpc.vpc_id
  internet_gateway_id=module.igw.igw_id
  public_subnet_ids = module.public_subnets.public_subnet_ids
}

module "private_subnets" {
  source                          = "./modules/private_subnet"
  vpc_id                          = module.vpc.vpc_id
  private_subnets_cidr            = var.private_subnets_cidr
  private_availability_zone       = var.private_availability_zone
  map_public_ip_on_launch_private = var.map_public_ip_on_launch_private
}

module "private_route_table" {
  source = "./modules/private_route_table"
  vpc_id= module.vpc.vpc_id
  nat_gateway_id=module.nat_gateway.nat_gateway_id
  private_subnet_ids = module.private_subnets.private_subnet_ids
}

module "nat_gateway" {
  source             = "./modules/nat_gateway"
  igw                = module.igw.igw_id
  connectivity_type  =var.connectivity_type
  public_subnet_ids  =module.public_subnets.public_subnet_ids
}
