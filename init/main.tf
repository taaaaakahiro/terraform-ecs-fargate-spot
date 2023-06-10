module "network" {
  source             = "../modules/network"
  env                = local.env
  service            = local.service
  availability_zones = local.availability_zones
  subnet_count       = local.subnet_count
}

module "iam" {
  source = "../modules/iam"
}

module "ecr" {
  source = "../modules/ecr"
}