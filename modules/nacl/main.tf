resource "aws_subnet" "private-subnet" {
  vpc_id = var.vpc_id
  
  count = length(var.private_subnets_cidr)
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = var.private_availability_zone[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch_private

  tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }
}

output "private_subnet_ids" {
  value       = aws_subnet.private-subnet[*].id
}