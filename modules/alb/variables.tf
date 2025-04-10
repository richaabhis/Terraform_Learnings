variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}
variable "public_lb_sg" {
  description = "Security group ID for the public ALB"
  type        = string
}

variable "private_lb_sg" {
  description = "Security group ID for the Private ALB"
  type        = string
}

variable "public_target_group_arn" {
  type        = string
  description = "The ARN of the public target group"
}

variable "private_target_group_arn" {
  type        = string
  description = "The ARN of the private target group"
}