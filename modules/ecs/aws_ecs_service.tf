resource "aws_ecs_service" "backend" {
  name                = "${var.env}-${var.service}-ecs-service"
  cluster             = aws_ecs_cluster.this.id
  task_definition     = aws_ecs_task_definition.backend.arn
  desired_count       = 2
  launch_type         = "FARGATE"
  scheduling_strategy = "REPLICA"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups = [var.security_group_id]
    subnets = var.private_subnet_ids
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "${var.env}-app"
    container_port   = 80
  }
}