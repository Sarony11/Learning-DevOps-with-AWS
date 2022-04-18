module "vpc" {
    source = "../../modules/vpc"

    project_name = local.project_name
    infra_env = local.infra_env
    project_repo = local.project_repo
    vpc_cidr = local.config["project"]["environment"]["dev"]["module"]["network"]["vpc"]
}