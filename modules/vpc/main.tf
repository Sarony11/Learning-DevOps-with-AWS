# resource https://www.youtube.com/watch?v=IpN0ZiXmufM
resource "aws_vpc" "aws-devops-vpc" {
    cidr_block = var.vpc_cidr

    tags = {
      "Name" = "${local.project_name}-${local.infra_env}-vpc"
      "Project" = local.project_name
      "Repository" = local.repo
      "Environment" = var.infra_env
      "ManagedBy" = "terraform"
    }
}

resource "aws_subnet" "public" {
    for_each = var.public_subnet_numbers
    
    vpc_id = aws_vpc.aws-devops-vpc.id
    
    cidr_block = cidrsubnet(aws_vpc.aws-devops-vpc.cidr_block, 4, each.value )
    tags = {
      "Name" = "${local.project_name}-${local.infra_env}-public-subnet"
      "Project" = local.project_name
      "Repository" = local.repo
      "Role" = "public"
      "Environment" = var.infra_env
      "ManagedBy" = "terraform"
      "Subnet" = "${each.key}-${each.value}"
    }
     
}

resource "aws_subnet" "private" {
    for_each = var.private_subnet_numbers
    
    vpc_id = aws_vpc.aws-devops-vpc.id
    
    cidr_block = cidrsubnet(aws_vpc.aws-devops-vpc.cidr_block, 4, each.value )
    tags = {
      "Name" = "${local.project_name}-${local.infra_env}-private-subnet"
      "Project" = local.project_name
      "Repository" = local.repo
      "Role" = "private"
      "Environment" = var.infra_env
      "ManagedBy" = "terraform"
      "Subnet" = "${each.key}-${each.value}"
    }
     
}