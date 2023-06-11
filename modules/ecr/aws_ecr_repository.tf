resource "aws_ecr_repository" "this" {
  name                 = "${var.env}-${var.service}-ecr"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}