alb_target_group_arns = ["arn:aws:elasticloadbalancing:ap-south-1:844682013238:targetgroup/app-tg/fdbcd81bb0a1d501"]

ami_id                 = "ami-02d26659fd82cf299"
ec2_security_group_id  = "sg-0befd2c5054a6c39c"
key_name               = "linux_key"
private_subnet_ids     = ["subnet-0f06b649ef7dda597","subnet-0821ddfe60f4861ae","subnet-0d57f1d7be72e8d28"]
# RDS values
rds_db_name            = "appdb"
rds_username           = "admin"
rds_password           = "cL0ck$123"
rds_instance_class     = "db.t3.micro"
rds_allocated_storage  = 20
rds_subnet_ids         = ["subnet-0f06b649ef7dda597","subnet-0821ddfe60f4861ae","subnet-0d57f1d7be72e8d28"]
rds_security_group_id  = "sg-09bc360dc59d6439d"
# VPC
vpc_id = "vpc-04bd898357c9f3e06"
