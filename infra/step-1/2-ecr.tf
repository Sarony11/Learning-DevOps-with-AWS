module "ecr" {
    source = "../../modules/ecr"

    project_name = local.project_name
    infra_env = local.infra_env
    ecr_repo_name = local.config["project"]["environment"]["dev"]["module"]["network"]["vpc"]
}