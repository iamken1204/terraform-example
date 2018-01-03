resource "aws_codedeploy_app" "cvgo2" {
  name = "cvgo2"
}

resource "aws_codedeploy_deployment_group" "ASTRAJP" {
  app_name              = "${aws_codedeploy_app.cvgo2.name}"
  deployment_group_name = "ASTRAJP"
  service_role_arn      = "arn:aws:iam::478205036267:role/NTT_service_role"

  autoscaling_groups = ["${aws_autoscaling_group.cvgo-asg.name}"]

  # auto_rollback_configuration {
  # enabled = false
  # }
}
