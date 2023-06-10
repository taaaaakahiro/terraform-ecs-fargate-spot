terraform {
  required_version = ">= 1.4.0"
  backend "s3" {
    bucket = "terraform-example-tkoide"
    key    = "terraform-ecs-fargate-spot/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = local.region
}