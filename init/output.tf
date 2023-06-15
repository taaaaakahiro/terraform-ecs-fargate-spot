output "vpc_id" {
  value = module.network.vpc_id
}

output "alb_arn" {
  value = module.network.alb_arn
}

output "alb_dns_name" {
  value = module.network.alb_dns_name
}

output "alb_target_group_arn" {
  value = module.network.alb_target_group_arn
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "ecr_repository_uri" {
  value = module.ecr.ecr_repository_uri
}

output "security_group_id" {
  value = module.network.security_group_id
}

output "ecs_task_execution_role_arn" {
  value = module.iam.ecs_task_execution_role_arn
}