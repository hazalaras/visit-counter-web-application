# CIDR block for the VPC
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

# A variable to enable or disable DNS support in the VPC.
variable "vpc_dns_support" {
  description = "DNS support for VPC"
  type        = bool
  default     = true
}

# A variable to enable or disable DNS hostnames in the VPC.
variable "vpc_dns_hostnames" {
  description = "DNS hostnames for VPC?"
  type        = bool
  default     = true
}

# List of AZs.
variable "availability_zone" {
  description = "List of allowed availability zones."
  type        = list(any)
  default     = ["us-east-1a", "us-east-1c"]
}

# A variable to map the public IP on launch for public subnets.
variable "map_public_ip" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  type        = bool
  default     = true
}

# CIDR block for the public subnet.
variable "public_cidr_1" {
  description = "The CIDR block for the first public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

# CIDR block for the public subnet.
variable "public_cidr_2" {
  description = "The CIDR block for the second public subnet."
  type        = string
  default     = "10.0.2.0/24"
}

# CIDR block for the private subnet.
variable "private_cidr_1" {
  description = "The CIDR block for the first private subnet."
  type        = string
  default     = "10.0.3.0/24"
}

# CIDR block for the private subnet.
variable "private_cidr_2" {
  description = "The CIDR block for the second private subnet."
  type        = string
  default     = "10.0.4.0/24"
}

# Desired number of instances to launch in the ECS cluster.
variable "desired_capacity" {
  description = "Number of instances to launch in the ECS cluster."
  type        = number
  default     = 1
}

# Maximum number of instances to launch in the ECS cluster.
variable "maximum_capacity" {
  description = "Maximum number of instances that can be launched in the ECS cluster."
  type        = number
  default     = 5
}

# EC2 instance type.
variable "instance_type" {
  description = "EC2 instance type for ECS launch configuration."
  type        = string
  default     = "m5.large"
}

# ECS service name.
variable "service_name" {
  description = "The name for the ECS service."
  type        = string
  default     = "flask-docker"
}

# Defines the ECR image URL.
variable "ecs_image_url" {
  description = "The desired ECR image URL."
  type        = string
}

# DynamoDB table name for visit count.
variable "dynamodb_table_name" {
  description = "DynamoDB table name."
  type        = string
  default     = "VisitCounter"
}
