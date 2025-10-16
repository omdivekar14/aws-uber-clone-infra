output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "asg_name" {
  value       = aws_autoscaling_group.app_asg.name
  description = "Auto Scaling Group name"
}

output "launch_template_id" {
  value       = aws_launch_template.app.id
  description = "Launch template ID"
}

output "rds_endpoint" {
  value       = aws_db_instance.app_rds.endpoint
  description = "RDS endpoint for the app"
}

output "rds_port" {
  value       = aws_db_instance.app_rds.port
  description = "RDS port"
}
