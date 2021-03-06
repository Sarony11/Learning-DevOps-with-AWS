variable "aws_region" {
    type = string
    default = "us-east-1"
    description = "AWS Region"
}

variable "project_name" {
    type = string
    description = "project name"
}

variable "project_repo" {
    type = string
    description = "project repository"
}

variable "infra_env" {
    type = string
    description = "infrastructure environment"
}

variable "vpc_cidr" {
    type = string
    description = "The IP range to use for the VPC"
    default = "192.168.0.0/17"
}

variable "public_subnet_numbers" {
    type = map(number)

    description = "Map of AZ to a number that should be used for public subnets"

    default = {
        "us-east-1a" = 1
        "us-east-1b" = 2
    }
}

variable "private_subnet_numbers" {
    type = map(number)

    description = "Map of AZ to a number that should be used for private subnets"

    default = {
        "us-east-1a" = 3
        "us-east-1b" = 4
    }
}