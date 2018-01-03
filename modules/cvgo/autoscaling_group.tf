resource "aws_autoscaling_policy" "cvgo_scale_in" {
  name                   = "cvgo_scale_in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.cvgo-asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "cvgo-sqs-idle" {
  alarm_name          = "cvgo-sqs-idle"
  comparison_operator = "LessThanOrEqualToThreshold" # <=
  period              = "300"
  evaluation_periods  = "1"

  namespace   = "AWS/SQS"
  metric_name = "ApproximateNumberOfMessagesVisible"
  statistic   = "Average"
  threshold   = "1"

  dimensions = {
    QueueName = "${var.cvgo_sqs_name}"
  }

  alarm_description = "Pressure of cvgo task queue is low"
  alarm_actions     = ["${aws_autoscaling_policy.cvgo_scale_in.arn}"]
}

resource "aws_autoscaling_policy" "cvgo_scale_out" {
  name                   = "cvgo_scale_out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.cvgo-asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "cvgo-sqs-busy" {
  alarm_name          = "cvgo-sqs-busy"
  comparison_operator = "GreaterThanOrEqualToThreshold" # >=
  period              = "300"
  evaluation_periods  = "1"

  namespace   = "AWS/SQS"
  metric_name = "ApproximateNumberOfMessagesVisible"
  statistic   = "Average"
  threshold   = "20"

  dimensions = {
    QueueName = "${var.cvgo_sqs_name}"
  }

  alarm_description = "Too much cvgo tasks in queue"
  alarm_actions     = ["${aws_autoscaling_policy.cvgo_scale_out.arn}"]
}

resource "aws_launch_configuration" "cvgo_asg_conf_" {
  name_prefix          = "[prod] py-cvgo (base)-v12-"
  image_id             = "${var.cvgo_ami_ID}"
  instance_type        = "c4.xlarge"
  spot_price           = 0.3
  iam_instance_profile = "NTT_service_role"
  key_name             = "astra-jp"

  # ebs_optimized               = true
  enable_monitoring           = true
  associate_public_ip_address = true

  security_groups = [
    "${var.sgSSH_ID}",
    "${var.sgCV_ID}",
  ]
}

resource "aws_launch_configuration" "cvgo_asg_conf" {
  name_prefix          = "[prod] py-cvgo (base)-v12-"
  image_id             = "${var.cvgo_ami_ID_asg}"
  instance_type        = "c4.xlarge"
  spot_price           = 0.3
  iam_instance_profile = "NTT_service_role"
  key_name             = "astra-jp"

  # ebs_optimized               = true
  enable_monitoring           = true
  associate_public_ip_address = true

  security_groups = [
    "${var.sgSSH_ID}",
    "${var.sgCV_ID}",
  ]
}

resource "aws_autoscaling_group" "cvgo-asg" {
  tags {
    key                 = "Name"
    value               = "cvgo-asg"
    propagate_at_launch = true
  }

  name                 = "cvgo-asg"
  launch_configuration = "${aws_launch_configuration.cvgo_asg_conf_.name}"
  max_size             = 50
  min_size             = 0

  # desired_capacity     = 1
  enabled_metrics = ["GroupStandbyInstances", "GroupTotalInstances", "GroupPendingInstances", "GroupTerminatingInstances", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupMinSize", "GroupMaxSize"]

  # subnet IDs
  vpc_zone_identifier       = ["${var.subnet_goServiceA_ID}", "${var.subnet_goServiceC_ID}"]
  availability_zones        = ["ap-northeast-1a", "ap-northeast-1c"]
  health_check_grace_period = 300
  health_check_type         = "EC2"

  load_balancers = ["${aws_elb.cvgo-elb.name}"]
}
