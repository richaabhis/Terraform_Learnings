# Variable to be given for VPC defination
#---------------------------------------- 
 cidr_block        = "92.10.0.0/24"
 instance_tenancy  = "default"
 vpc_name          = "abhishek-vpc"

# Variable to be given for IGW defination
#---------------------------------------- 
 igw_name= "abhishek-igw"

# Variable to be given for public_subnets defination
#---------------------------------------- 
 public_subnets_cidr       = ["92.10.0.0/27", "92.10.0.32/27"]
 public_availability_zones = ["us-east-1a", "us-east-1b"]
 map_public_ip_on_launch   = "true"

# Variable to be given for private_subnets defination
#---------------------------------------- 
 private_subnets_cidr            = ["92.10.0.64/27", "92.10.0.96/27" , "92.10.0.128/27"]
 private_availability_zone       = ["us-east-1a", "us-east-1b" , "us-east-1c"]
 map_public_ip_on_launch_private = "false"

 # Variable to be given for Public Route Tanle defination
#--------------------------------------------------------

# Variable to be given for NAT GATEWAY defination
#----------------------------------------
connectivity_type= "public"




# Variable to be given for ALB Target Group defination
#------------------------------------------------
# Public Target Group variables
public_target_type = "ip"  # Targets are IP addresses
public_target_group_name = "public-target-group"
public_target_group_protocol = "HTTP"
public_target_group_port = 80
public_ip_address_type = "ipv4"
public_protocol_version = "HTTP1"

# Private Target Group variables
private_target_type = "ip"  # Targets are IP addresses
private_target_group_name = "private-target-group"
private_target_group_protocol = "HTTP"
private_target_group_port = 80
private_ip_address_type = "ipv4"
private_protocol_version = "HTTP1"

# Health check variables
health_check_interval = 30
health_check_path = "/health"  # Customize this path to match your health check endpoint
health_check_port = 80
health_check_protocol = "HTTP"
health_check_timeout = 5
health_check_healthy_threshold = 3
health_check_unhealthy_threshold = 3
