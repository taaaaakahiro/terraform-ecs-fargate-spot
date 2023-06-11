resource "aws_lb_target_group" "this" {
  name        = "${var.env}-fargate-spot-tg-alb"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.this.id
}