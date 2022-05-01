# resource https://www.youtube.com/watch?v=IpN0ZiXmufM/* 
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr

    tags = {
      "Name" = "${var.project_name}-${var.infra_env}-vpc"
      "Project" = var.project_name
      "Repository" = var.project_repo
      "Environment" = var.infra_env
      "ManagedBy" = "terraform"
    }
}

resource "aws_subnet" "public" {
    for_each = var.public_subnet_numbers
    vpc_id = aws_vpc.vpc.id
    map_public_ip_on_launch = true
    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value )
    availability_zone = data.aws_availability_zones.azs.names["${each.value}"-1]
    tags = {
      "Name" = "${var.project_name}-${var.infra_env}-public-subnet-${each.value}"
      "Project" = var.project_name
      "Repository" = var.project_repo
      "Role" = "public"
      "Environment" = var.infra_env
      "ManagedBy" = "terraform"
      "Subnet" = "${each.key}-${each.value}"
    }
     
}

resource "aws_subnet" "private" {
    for_each = var.private_subnet_numbers
    vpc_id = aws_vpc.vpc.id
    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value )
    availability_zone = data.aws_availability_zones.azs.names["${each.value}"-3]
    tags = {
      "Name" = "${var.project_name}-${var.infra_env}-private-subnet-${each.value}"
      "Project" = var.project_name
      "Repository" = var.project_repo
      "Role" = "private"
      "Environment" = var.infra_env
      "ManagedBy" = "terraform"
      "Subnet" = "${each.key}-${each.value}"
    }
     
}