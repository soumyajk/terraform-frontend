
resource "aws_elb" "fe-lb" {
  name               = "fe-lb"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  internal	     = false
  instances          = ["${aws_instance.frontend.0.id}","${aws_instance.frontend.1.id}"]
  source_security_group = "default"
listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
}

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

}
