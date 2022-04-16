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

variable "project_name" {
    type = string
    description = "Project name"
}

variable "backend_bucket" {
    type = string
    description = "S3 bucket to store Terraform state"
}

variable "backend_bucket_key" {
    type = string
    description = "S3 key to store Terraform state"
}

variable "vpc_cidr" {
    type = string
    description = "The IP range to use for the VPC"
}

variable "ecr_repo_name" {
    type = string
    description = "ECR repo to store a Docker image"
}