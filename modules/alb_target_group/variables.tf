# Public Target Group variables
variable "public_target_type" {
  description = "The target type for the public target group (e.g., ip)"
  type        = string
  default     = "ip"
}

variable "public_target_group_name" {
  description = "The name of the public target group"
  type        = string
  default     = "public-target-group"
}

variable "public_target_group_protocol" {
  description = "The protocol for the public target group"
  type        = string
  default     = "HTTP"
}

variable "public_target_group_port" {
  description = "The port for the public target group"
  type        = number
  default     = 80
}

variable "public_ip_address_type" {
  description = "The IP address type for the public target group (e.g., ipv4)"
  type        = string
  default     = "ipv4"
}

variable "vpc_id" {
  description = "The VPC ID for the public target group"
  type        = string
}

variable "public_protocol_version" {
  description = "The protocol version for the public target group (e.g., HTTP1, HTTP2)"
  type        = string
  default     = "HTTP1"
}

# Private Target Group variables
variable "private_target_type" {
  description = "The target type for the private target group (e.g., ip)"
  type        = string
  default     = "ip"
}

variable "private_target_group_name" {
  description = "The name of the private target group"
  type        = string
  default     = "private-target-group"
}

variable "private_target_group_protocol" {
  description = "The protocol for the private target group"
  type        = string
  default     = "HTTP"
}

variable "private_target_group_port" {
  description = "The port for the private target group"
  type        = number
  default     = 80
}

variable "private_ip_address_type" {
  description = "The IP address type for the private target group (e.g., ipv4)"
  type        = string
  default     = "ipv4"
}

variable "private_protocol_version" {
  description = "The protocol version for the private target group (e.g., HTTP1, HTTP2)"
  type        = string
  default     = "HTTP1"
}

# Health Check variables
variable "health_check_interval" {
  description = "The health check interval (in seconds)"
  type        = number
  default     = 30
}

variable "health_check_path" {
  description = "The path for the health check endpoint"
  type        = string
  default     = "/health"
}

variable "health_check_port" {
  description = "The port for the health check"
  type        = number
  default     = 80
}

variable "health_check_protocol" {
  description = "The protocol for the health check"
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The timeout for the health check (in seconds)"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "The number of successful health checks required before considering the target healthy"
  type        = number
  default     = 3
}

variable "health_check_unhealthy_threshold" {
  description = "The number of failed health checks required before considering the target unhealthy"
  type        = number
  default     = 3
}
