resource "aws_ecr_repository" "app" {
  name                 = local.project_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    # Disabled in example. Please enable it in real production ENVs
    scan_on_push = false
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  # "false" in Production
  force_delete = true
}

output "ecr_repository_name" {
  value = aws_ecr_repository.app.name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}
