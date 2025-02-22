resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "NAT_Eip"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = var.public_subnet_ids[0]
    depends_on    = [var.igw]
    connectivity_type = var.connectivity_type
    tags = {
        Name = "Nat_Gateway"
    }
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.nat-gateway.id
}