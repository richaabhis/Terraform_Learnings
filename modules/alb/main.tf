# Public Load Balancer (ALB) in public subnets
resource "aws_lb" "public_alb" {
  name               = "public-alb"
  internal           = false  # This makes it internet-facing
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  ip_address_type    = "ipv4"  # This enables IPv4 only
  security_groups    = [var.public_lb_sg]  # Reference the public LB SG ID

  enable_deletion_protection = false

  tags = {
    Name = "Public-ALB"
  }
}

# Output for Public ALB DNS Name
output "public_alb_dns_name" {
  value       = aws_lb.public_alb.dns_name
  description = "The DNS name of the public ALB"
}

# Private Load Balancer (ALB) in private subnets
resource "aws_lb" "private_alb" {
  name               = "private-alb"
  internal           = true  # This makes it internal (private)
  load_balancer_type = "application"
  subnets            = var.private_subnet_ids
  ip_address_type    = "ipv4"  # This enables IPv4 only
  security_groups    = [var.private_lb_sg]  # Reference the private LB SG ID

  enable_deletion_protection = false

  tags = {
    Name = "Private-ALB"
  }
}

# Output for Private ALB DNS Name
output "private_alb_dns_name" {
  value       = aws_lb.private_alb.dns_name
  description = "The DNS name of the private ALB"
}