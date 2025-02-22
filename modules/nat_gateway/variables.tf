variable "igw" {
  description = "Internet Gateway on which private subnets can get internet access"
}

variable "connectivity_type" {
  description = "Use \"public / private\" for an Internet-accessible NAT gateway"
}

variable "public_subnet_ids" {
  description = "Subnets ID's which will be getting Internet Access"
}
