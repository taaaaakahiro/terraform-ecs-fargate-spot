module "ecs" {
  source  = "../modules/ecs"
  env     = local.env
  service = local.service
}