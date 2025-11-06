# ALB + EC2
alb_target_group_arns  = ["arn:aws:elasticloadbalancing:ap-south-1:844682013238:targetgroup/app-tg/fdbcd81bb0a1d501"]
ami_id                 = "ami-02d26659fd82cf299"
key_name               = "linux_key"

# Security Groups (all belong to vpc-0db64bf45db3c6e62)
alb_security_group_id  = "sg-0aa600561bd5b7644"
ec2_security_group_id  = "sg-09d03067a4efe5427"
rds_security_group_id  = "sg-02757aab41a178ecd"

# Subnets (same VPC)
public_subnet_ids      = ["subnet-0a53b6d82d2eec203","subnet-05c800882b7233919"]
private_subnet_ids     = ["subnet-03579cbd6c6a768c9","subnet-0f53c036a9961f67f","subnet-04d991351c491840f"]
rds_subnet_ids         = ["subnet-03579cbd6c6a768c9","subnet-0f53c036a9961f67f","subnet-04d991351c491840f"]

# RDS configuration
rds_db_name            = "appdb"
rds_username           = "admin"
rds_password           = "cL0ck$123"
rds_instance_class     = "db.t3.micro"
rds_allocated_storage  = 20

# VPC (consistent)
vpc_id = "vpc-0db64bf45db3c6e62"
