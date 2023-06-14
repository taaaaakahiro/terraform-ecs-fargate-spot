resource "aws_cloudwatch_log_group" "ecs" {
  name              = "${var.env}/ecs/fargate/spot"
  retention_in_days = 30
}