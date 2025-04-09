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
  description = "Security group ID for the private ALB"
  type        = string
}