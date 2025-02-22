resource "aws_route_table" "public-route-table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "Public Route Table"
  }
}


resource "aws_route_table_association" "public-subnet-association" {
    count = length(var.public_subnet_ids)
    subnet_id=var.public_subnet_ids[count.index]
    route_table_id=aws_route_table.public-route-table.id
}