locals {
    config = jsondecode(file("../../config.json"))
    project_name = local.config["project"]["name"]
    project_repo = local.config["project"]["repository"]
    infra_env = "dev"
    aws_profile = local.config["project"]["environment"][local.infra_env]["aws"]["profile"]
    aws_region = local.config["project"]["environment"][local.infra_env]["aws"]["region"]
    instance_type = local.config["project"]["environment"][local.infra_env]["module"]["eks"]["instance_type"]
    private_subnets = { 
            for subnet in data.aws_subnet.private.* :
                "${ subnet.availability_zone }" => subnet... 
     }

     public_subnets = { 
            for subnet in data.aws_subnet.public.* :
                "${ subnet.availability_zone }" => subnet... 
     }
}