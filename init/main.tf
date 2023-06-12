module "network" {
  source             = "../modules/network"
  env                = local.env
  service            = local.service
  availability_zones = local.availability_zones
  subnet_count       = local.subnet_count
}

# module "iam" {
#   source  = "../modules/iam"
#   env     = local.env
#   service = local.service
# }

module "ecr" {
  source  = "../modules/ecr"
  env     = local.env
  service = local.service
}