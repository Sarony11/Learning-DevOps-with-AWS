module "eks" {
    source = "../modules/eks"

    infra_env = var.infra_env
    project_name = var.project_name
    subnet_id_1 = "subnet-07d002bb7e32b67fc"
    subnet_id_2 = "subnet-03c49bbe3a085ef44"
}