variable "vpc_id" {
  description = "VPC under which Public Subnets will be created"
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