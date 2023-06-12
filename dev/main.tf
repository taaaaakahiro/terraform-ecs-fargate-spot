module "ecs" {
  source               = "../modules/ecs"
  env                  = local.env
  service              = local.service
  private_subnet_ids   = data.terraform_remote_state.init.outputs.private_subnet_ids
  security_group_id    = data.terraform_remote_state.init.outputs.security_group_id
  alb_target_group_arn = data.terraform_remote_state.init.outputs.alb_target_group_arn
  ecr_repository_uri   = data.terraform_remote_state.init.outputs.ecr_repository_uri
}