variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "vpc_id" {
  description = "VPC ID where resources are deployed"
}

variable "my_ip" {
  description = "Your IP for SSH access to EC2"
  type        = string
  default     = "203.194.96.238/32" # CHANGE THIS to your real IP later!
}

# EC2 / Auto Scaling Group variables
variable "launch_template_name" {
  type    = string
  default = "app-server-"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instances"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "alb_security_group_id" {
  type        = string
  description = "Security group ID for the Application Load Balancer"
}

variable "ec2_security_group_id" {
  type        = string
  description = "Security group ID for EC2 instances"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for EC2 instances"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 4
}

variable "alb_target_group_arns" {
  type        = list(string)
  description = "List of ALB target group ARNs for ASG"
}

# RDS variables
variable "rds_db_name" {
  default     = "appdb"
  description = "Database name"
}

variable "rds_username" {
  default     = "admin"
  description = "Master DB username"
}

variable "rds_password" {
  description = "Master DB password"
  type        = string
  sensitive   = true
}

variable "rds_instance_class" {
  default     = "db.t3.micro"
  description = "RDS instance type"
}

variable "rds_allocated_storage" {
  default     = 20
  description = "RDS storage in GB"
}

variable "rds_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for RDS"
}

variable "rds_security_group_id" {
  description = "Security group ID for RDS"
}

