variable "vpc_id" {
  description = "This is vpc_id for igw"
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
