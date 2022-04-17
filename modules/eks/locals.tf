locals {
    config = jsondecode(file("../config.json"))
    project_name = local.config["project"]["name"]
    infra_env = var.infra_env
    repo = local.config["project"]["repository"]
    vpc_cidr = local.config["project"]["environment"]["dev"]["module"]["network"]["vpc"]
    instance_type = local.config["project"]["environment"]["dev"]["module"]["eks"]["instance_type"]
}