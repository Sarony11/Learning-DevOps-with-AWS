module "vpc" {
    source = "./modules/vpc"

    infra_env = "dev"
    vpc_cidr = "10.0.0.0/17"
}