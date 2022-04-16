module "vpc" {
    source = "./modules/vpc"

    infra_env = var.infra_env
    project_name = var.project_name
    vpc_cidr = var.vpc_cidr
}