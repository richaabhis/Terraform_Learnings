resource "aws_vpc" "abhishek-vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

output "vpc_id" {
  value       = aws_vpc.abhishek-vpc.id
}