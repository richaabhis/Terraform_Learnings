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
 public_subnets_cidr       = ["92.10.0.0/26", "92.10.0.64/26"]
 public_availability_zones = ["us-east-1a", "us-east-1b"]
 map_public_ip_on_launch   = "true"

# Variable to be given for private_subnets defination
#---------------------------------------- 
 private_subnets_cidr            = ["92.10.0.128/26", "92.10.0.192/26"]
 private_availability_zone       = ["us-east-1a", "us-east-1b"]
 map_public_ip_on_launch_private = "false"