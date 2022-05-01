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
    bucket_key = "step2-terraform.tfstate"

    # ECR Registry
    ecr_repo_name = "${local.project_name}-${local.infra_env}-ecr"
    
    # VPC and Subnets
    vpc_cidr = local.config["project"]["environment"][local.infra_env]["module"]["network"]["vpc_cidr"]

    # EKS Cluster
    instance_type = local.config["project"]["environment"][local.infra_env]["module"]["eks"]["instance_type"]
    
/*      private_subnets = { 
            for subnet in data.aws_subnet.private.* :
                "${ subnet.availability_zone }" => subnet... 
     }

     public_subnets = { 
            for subnet in data.aws_subnet.public.* :
                "${ subnet.availability_zone }" => subnet... 
     } */
}