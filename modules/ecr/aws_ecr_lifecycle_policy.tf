
resource "aws_ecr_lifecycle_policy" "this" {
  repository = aws_ecr_repository.this.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images latest 2 images",
            "selection": {
                "countNumber": 2,
                "countType": "imageCountMoreThan",
                "tagStatus": "any"
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}