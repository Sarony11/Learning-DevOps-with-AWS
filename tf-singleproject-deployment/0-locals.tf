/* locals {
    config = jsondecode(file("../config.json"))
    project_name = local.config["name"]
    project_repo = local.config["repository"]
    infra_env = local.config["environment"][0][0]
    environment = "${project_name}-${infra_env}"
    //aws_profile = local.config["aws_profile"][0]
} */