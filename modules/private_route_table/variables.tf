variable "vpc_id" {
  description = "This is vpc_id for public route table"
}

variable "nat_gateway_id" {
  description = "Need to define the Internet Gateway for accessing the Internet throught public Subent"
}

variable "private_subnet_ids" {
  description = "Private Subnets ID's which will be getting Internet Access"
}
