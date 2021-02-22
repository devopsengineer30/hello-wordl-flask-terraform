### ECR

resource "aws_ecr_repository" "hello-world-flask" {
  name                 = var.project
  image_tag_mutability = "MUTABLE"

  tags = {
    project = var.project
  }
}

output "ecr_arn" {
  value = aws_ecr_repository.hello-world-flask.arn
}
