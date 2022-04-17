module "vpc" {
    source = "../modules/vpc"

    infra_env = local.infra_env
}