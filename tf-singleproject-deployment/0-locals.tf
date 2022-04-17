locals {
    config = jsondecode(file("../config.json"))
    project_name = local.config["project"]["name"]
    project_repo = local.config["project"]["repository"]
    infra_env = local.config["project"]["environment"]
    environment = "dev"
    aws_profile = local.config["project"]["environment"][local.environment]["aws"]["profile"]
    aws_region = local.config["project"]["environment"][local.environment]["aws"]["region"]
}