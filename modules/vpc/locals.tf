locals {
    config = jsondecode(file("../config.json"))
    project_name = local.config["project"]["name"]
    infra_env = var.infra_env
    repo = local.config["project"]["repository"]
}