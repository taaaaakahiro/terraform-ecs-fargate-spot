data "terraform_remote_state" "init" {
  backend = "s3"

  config = {
    bucket = "terraform-example-tkoide"
    key    = "terraform-ecs-fargate-spot/init/terraform.tfstate"
    region = "ap-northeast-1"
  }
}