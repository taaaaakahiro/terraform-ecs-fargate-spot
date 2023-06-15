module "ecs" {
  source                      = "../modules/ecs"
  env                         = local.env
  service                     = local.service
  private_subnet_ids          = data.terraform_remote_state.init.outputs.private_subnet_ids
  security_group_id           = data.terraform_remote_state.init.outputs.security_group_id
  alb_target_group_arn        = data.terraform_remote_state.init.outputs.alb_target_group_arn
  ecr_repository_uri          = data.terraform_remote_state.init.outputs.ecr_repository_uri
  cloudwatch_log_group_name   = module.cloudwatch.log_group_name
  region                      = local.region
  ecs_task_execution_role_arn = data.terraform_remote_state.init.outputs.ecs_task_execution_role_arn
}

module "cloudwatch" {
  source = "../modules/cloudwatch"
  env    = local.env
}