resource "aws_elb" "cvgo-elb" {
  tags {
    "Name" = "cvgo-elb"
  }

  name            = "cvgo-elb"
  subnets         = ["${var.subnet_goServiceA_ID}", "${var.subnet_goServiceC_ID}"]
  security_groups = ["${var.sgCV_ID}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    target              = "HTTP:8080/gl"
  }

  instances                 = ["${aws_instance.cvgo_base.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 60
}
