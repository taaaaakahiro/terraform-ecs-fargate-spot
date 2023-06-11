output "vpc_id" {
  value = module.network.vpc_id
}

output "alb_arn" {
  value = module.network.alb_arn
}

output "alb_dns_name" {
  value = module.network.alb_dns_name
}

output "private_subnet_for_ecs_id" {
  value = [for subnet in module.network.private_subnet_for_ecs : subnet.id]
}

output "ecr_repository_url" {
  value = module.ecr.ecr_repository_url
}