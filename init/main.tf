module "network" {
  source = "../modules/network"
}

module "iam" {
  source = "../modules/iam"
}

module "ecr" {
  source = "../modules/ecr"
}