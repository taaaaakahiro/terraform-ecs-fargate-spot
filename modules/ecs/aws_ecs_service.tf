resource "aws_ecs_service" "backend" {
  name                = "${var.env}-${var.service}-ecs-service"
  cluster             = aws_ecs_cluster.this.id
  task_definition     = aws_ecs_task_definition.backend.arn
  desired_count       = 2
  health_check_grace_period_seconds = 60

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    base              = 0
    weight            = 1
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    base              = 0
    weight            = 1
  }

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

  lifecycle {
    ignore_changes = [
      desired_count,
      task_definition,
      capacity_provider_strategy
    ]
  }
}