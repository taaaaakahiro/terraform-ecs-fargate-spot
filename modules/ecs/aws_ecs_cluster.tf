resource "aws_ecs_cluster" "this" {
  name = "${var.env}-${var.service}-ecs-cluster"
}