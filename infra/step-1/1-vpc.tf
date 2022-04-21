module "vpc" {
    source = "../../modules/vpc"

    aws_region = local.aws_region
    project_name = local.project_name
    infra_env = local.infra_env
    project_repo = local.project_repo
    vpc_cidr = local.vpc_cidr
    azs_numbers = local.azs_numbers
}