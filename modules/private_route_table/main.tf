resource "aws_route_table" "private-route-table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway_id
  }

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "private-subnet-association" {
    count = length(var.private_subnet_ids)
    subnet_id=var.private_subnet_ids[count.index]
    route_table_id=aws_route_table.private-route-table.id
}