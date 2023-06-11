output "vpc_id" {
  value = module.network.vpc_id
}

output "alb_arn" {
  value = module.network.alb_arn
}

output "alb_dns_name"{
    value = module.network.alb_dns_name
}