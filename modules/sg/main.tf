# Public Load Balancer Security Group
resource "aws_security_group" "public_lb_sg" {
  vpc_id      = var.vpc_id
  name        = "public-lb-sg"
  description = "Security group for the Load Balancer in the public subnet"

  # Inbound rules: Allow HTTP/HTTPS from the internet (0.0.0.0/0)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP traffic from the internet"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS traffic from the internet"
  }

  # Outbound rules: Allow all outbound traffic (forward to EC2 instances)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "Public-LB-SG"
  }
}

# Output for Public LB SG ID
output "public_lb_sg_id" {
  value       = aws_security_group.public_lb_sg.id
  description = "The ID of the security group for the public load balancer"
}

# Private Load Balancer Security Group
resource "aws_security_group" "private_lb_sg" {
  vpc_id      = var.vpc_id
  name        = "private-lb-sg"
  description = "Security group for the private load balancer"

  # Inbound rules: Allow traffic from the public subnet (ALB or NLB in the public subnet)
  ingress {
    from_port    = 80
    to_port      = 80
    protocol     = "tcp"
    security_groups = [aws_security_group.public_lb_sg.id]  # Reference the public LB SG ID
    description  = "Allow HTTP traffic from the public subnet"
  }

  ingress {
    from_port    = 443
    to_port      = 443
    protocol     = "tcp"
    security_groups = [aws_security_group.public_lb_sg.id]  # Reference the public LB SG ID
    description  = "Allow HTTPS traffic from the public subnet"
  }

  # Outbound rules: Allow traffic to backend resources (e.g., private instances or database)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all protocols to outbound resources
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "Private-LB-SG"
  }
}

# Output for Private LB SG ID
output "private_lb_sg_id" {
  value       = aws_security_group.private_lb_sg.id
  description = "The ID of the security group for the private load balancer"
}
