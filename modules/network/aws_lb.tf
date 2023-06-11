resource "aws_lb" "this" {
  name = "${var.env}-fargate-spot-alb"
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.alb.id
  ]
  subnets = [for subnet in aws_subnet.public : subnet.id]
}
