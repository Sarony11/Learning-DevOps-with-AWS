locals {
    config = jsondecode(file("../../config.json"))
    project_name = local.config["project"]["name"]
    project_repo = local.config["project"]["repository"]
    infra_env = "dev"
    aws_profile = local.config["project"]["environment"][local.infra_env]["aws"]["profile"]
    aws_region = local.config["project"]["environment"][local.infra_env]["aws"]["region"]
    bucket_backend_name = "${local.project_name}-${local.infra_env}-tfstate"
    bucket_backend_key = "init-terraform.tfstate"
    ecr_repo_name = "${local.project_name}-${local.infra_env}-ecr"
}