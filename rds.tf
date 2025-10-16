resource "aws_db_subnet_group" "rds_subnets" {
  name       = "rds-subnet-group"
  subnet_ids = var.rds_subnet_ids
}

resource "aws_db_instance" "app_rds" {
  allocated_storage     = var.rds_allocated_storage
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = var.rds_instance_class
  db_name                  = var.rds_db_name
  username              = var.rds_username
  password              = var.rds_password
  db_subnet_group_name  = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids = [var.rds_security_group_id]
  skip_final_snapshot   = true
  publicly_accessible   = false
}
