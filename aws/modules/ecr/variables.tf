variable ecr_repo_name {
    type = string
    description = "ECR repo to store a Docker image"
}

variable "infra_env" {
    type = string
    description = "infrastructure environment"
}