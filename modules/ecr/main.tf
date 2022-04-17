resource "aws_ecr_repository" "aws_ecr_repo" {
    name = local.ecr_repo_name
    # https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true
    }
}