module "eks" {
    source = "../../modules/eks"

    project_name = local.project_name
    project_repo = local.project_repo
    infra_env = local.infra_env
    instance_type = local.instance_type
/*     subnet_public-01 = data.aws_subnet.public-01
    subnet_public-02 = data.aws_subnet.public-02
    subnet_private-03 = data.aws_subnet.private-03
    subnet_private-04 = data.aws_subnet.private-04
    subnets_public = local.public_subnets
    subnets_private = local.private_subnets */
}