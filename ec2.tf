# ------------------------------
# EC2 IAM Role and Instance Profile for SSM
# ------------------------------
resource "aws_iam_role" "ec2_ssm_role" {
  name = "ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ec2_ssm_profile" {
  name = "ec2-ssm-profile"
  role = aws_iam_role.ec2_ssm_role.name
}

# ------------------------------
# Launch Template
# ------------------------------
resource "aws_launch_template" "app" {
  name_prefix   = "app-server-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_ssm_profile.name
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.ec2_security_group_id]
  }

  user_data = filebase64("${path.module}/user_data.sh.tftpl")

  lifecycle {
    create_before_destroy = true
  }
}

# ------------------------------
# Auto Scaling Group
# ------------------------------
resource "aws_autoscaling_group" "app_asg" {
  desired_capacity        = var.desired_capacity
  min_size                = var.min_size
  max_size                = var.max_size
  vpc_zone_identifier     = var.private_subnet_ids

  launch_template {
    id = aws_launch_template.app.id
  }

  target_group_arns           = [aws_lb_target_group.app_tg.arn]
  health_check_type           = "ELB"
  health_check_grace_period   = 300
  force_delete                = true

  tag {
    key                 = "Name"
    value               = "app-server"
    propagate_at_launch = true
  }
}

# ------------------------------
# Scaling Policies & CloudWatch Alarms
# ------------------------------
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "scale-up-cpu"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "scale-down-cpu"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.app_asg.name
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.app_asg.name
  }
}
