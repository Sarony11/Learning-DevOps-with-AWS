module "ecr" {
    source = "../modules/ecr"

    infra_env = local.infra_env
}