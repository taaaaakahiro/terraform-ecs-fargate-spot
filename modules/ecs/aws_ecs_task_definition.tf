resource "aws_ecs_task_definition" "backend" {
  family                   = "${var.env}-${var.service}-ecs-def"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  task_role_arn            = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"
  // jsonファイルを使う場合
#   container_definitions    = var.container-definition-file
  // codeで書く場合
  container_definitions = jsonencode([
    {
      name   = "${var.env}-app"
      image  = "${var.ecr_repository_uri}:latest"
      cpu    = 128
      memory = 256
      healthcheck = {
        command = ["CMD-SHELL", "curl -f http://127.0.0.1/ || exit 1"]
        interval = 20
        retries = 2
        timeout = 5
      }

      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options   = {
          awslogs-region : var.region
          awslogs-group : var.cloudwatch_log_group_name
          awslogs-stream-prefix : "ecs"
        }
      }
    }
  ])
}