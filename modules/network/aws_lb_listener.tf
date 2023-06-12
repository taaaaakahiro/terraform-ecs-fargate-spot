resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port = 80
  protocol = "HTTP"
#   certificate_arn = data.aws_acm_certificate.host_domain_wc_acm.arn
# 疎通確認
#   default_action {
#     type = "fixed-response"
#     fixed_response {
#       content_type = "text/plain"
#       message_body = "503 Service Temporarily Unavailable"
#       status_code = "503"
#     }
#   }
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
