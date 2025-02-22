variable "cidr_block" {
  description = "Define CIDR Range of the AWS Cloud"
}

variable "instance_tenancy" {
  description = "Need To define Instance Tenancy of VPC"
}

variable "vpc_name" {
  description = "Define VPC Name of the AWS Cloud"
}

variable "igw_name" {
  description = "Name provied to Internet Gateway Resource"
}

variable "public_subnets_cidr" {
  description = "List of CIDR blocks for public subnets"
}

variable "public_availability_zones" {
  description = "List of Availability Zones for public subnets"
}

variable "map_public_ip_on_launch" {
  description = "Whether public IPs should be assigned to instances by default"
}

variable "private_subnets_cidr" {
  description = "List of CIDR blocks for private subnets"
}

variable "private_availability_zone" {
  description = "List of Availability Zones for private subnets"
}

variable "map_public_ip_on_launch_private" {
  description = "Whether public IPs should be assigned to instances by default"
}
