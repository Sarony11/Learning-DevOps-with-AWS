variable "aws_region" {
    type = string
    description = "AWS region"
    default = "us-east-1"
}

variable "aws_profile" {
    type = string
    description = "AWS CLI local profile"
}

variable "infra_env" {
    type = string
    description = "Infrastructure environment"
}

variable "vpc_cidr" {
    type = string
    description = "The IP range to use for the VPC"
}

variable "ecr_repo_name" {
    type = string
    description = "ECR repo to store a Docker image"
}