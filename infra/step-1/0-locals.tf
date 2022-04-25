
locals {
    config = jsondecode(file("../../config.json"))
    project_name = local.config["project"]["name"]
    project_repo = local.config["project"]["repository"]
    infra_env = "dev"

    # AWS Account Configuration
    aws_profile = local.config["project"]["environment"][local.infra_env]["aws"]["profile"]
    aws_region = local.config["project"]["environment"][local.infra_env]["aws"]["region"]
    
    # Terraform State Backend
    bucket_name = "${local.project_name}-${local.infra_env}-tfstate"
    bucket_key = "init-terraform.tfstate"
    # ECR Registry
    ecr_repo_name = "${local.project_name}-${local.infra_env}-ecr"
    
    # VPC and Subnets
    vpc_cidr = local.config["project"]["environment"][local.infra_env]["module"]["network"]["vpc_cidr"]
}