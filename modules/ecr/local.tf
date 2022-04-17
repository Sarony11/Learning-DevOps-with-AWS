locals {
    config = jsondecode(file("../config.json"))
    project_name = local.config["project"]["name"]
    infra_env = var.infra_env
    ecr_repo_name = "${local.project_name}-${local.infra_env}-ecr"
}