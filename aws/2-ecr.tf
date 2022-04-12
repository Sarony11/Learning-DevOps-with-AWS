module "ecr" {
    source = "./modules/ecr"

    infra_env = var.infra_env
    ecr_repo_name = var.ecr_repo_name
}