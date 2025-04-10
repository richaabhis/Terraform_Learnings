# Public Target Group (for Public ALB) with IP target type
resource "aws_lb_target_group" "public_target_group" {
  target_type 		= var.public_target_type 
  name        		= var.public_target_group_name 
  protocol    		= var.public_target_group_protocol 
  port        		= var.public_target_group_port
  ip_address_type = var.public_ip_address_type
  vpc_id      		= var.vpc_id
  protocol_version= var.public_protocol_version


  health_check {
    interval                = var.health_check_interval
    path                    = var.health_check_path   # Customizeable path to match your health check endpoint
    port                    = var.health_check_port
    protocol                = var.health_check_protocol
    timeout                = var.health_check_timeout
    healthy_threshold      = var.health_check_healthy_threshold
    unhealthy_threshold    = var.health_check_unhealthy_threshold
  }

  tags = {
    Name = "Public-Target-Group"
  }
}

# Output for Public Target Group ARN
output "public_target_group_arn" {
  value       = aws_lb_target_group.public_target_group.arn
  description = "The ARN of the public target group"
}




# Private Target Group (for Private ALB) with IP target type
resource "aws_lb_target_group" "private_target_group" {
  target_type 		= var.private_target_type 
  name        		= var.private_target_group_name 
  protocol    		= var.private_target_group_protocol 
  port        		= var.private_target_group_port
  ip_address_type = var.private_ip_address_type
  vpc_id      		= var.vpc_id
  protocol_version= var.private_protocol_version

  health_check {
    interval                = var.health_check_interval
    path                    = var.health_check_path   # Customizeable path to match your health check endpoint
    port                    = var.health_check_port
    protocol                = var.health_check_protocol
    timeout                = var.health_check_timeout
    healthy_threshold      = var.health_check_healthy_threshold
    unhealthy_threshold    = var.health_check_unhealthy_threshold
  }

  tags = {
    Name = "Private-Target-Group"
  }
}

# Output for Private Target Group ARN
output "private_target_group_arn" {
  value       = aws_lb_target_group.private_target_group.arn
  description = "The ARN of the private target group"
}