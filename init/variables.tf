locals {
  region             = "ap-northeast-1"
  env                = "dev"
  service            = "terraform-ecs-fargate-spot"
  availability_zones = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
  subnet_count       = 3
}
