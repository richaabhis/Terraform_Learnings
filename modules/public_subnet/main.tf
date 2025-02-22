resource "aws_subnet" "public-subnets" {
  vpc_id = var.vpc_id

  count                   = length(var.public_subnets_cidr)
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.public_availability_zones[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

output "public_subnet_ids" {
  value       = aws_subnet.public-subnets[*].id
}