module "vpc" {
    source = "./modules/vpc"

    infra_env = var.infra_env
    vpc_cidr = var.vpc_cidr
}