resource "aws_ecr_repository" "aws_ecr_repo" {
    name = "${var.ecr_repo_name}-${var.infra_env}"
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}