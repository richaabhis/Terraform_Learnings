variable "vpc_id" {
  description = "This is vpc_id for public route table"
}

variable "internet_gateway_id" {
  description = "Need to define the Internet Gateway for accessing the Internet throught public Subent"
}

variable "public_subnet_ids" {
  description = "Subnets ID's which will be getting Internet Access"
}
