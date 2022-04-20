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

variable "instance_type" {
    type = string
    description = "EKS instance type"
}

/* variable "subnet_public-01" {
    type = string
    description = "Public Subnet in us-east-1a"
}

variable "subnet_public-02" {
    type = string
    description = "Public Subnet in us-east-1b"
}

variable "subnet_private-03" {
    type = string
    description = "Public Subnet in us-east-1a"
}

variable "subnet_private-04" {
    type = string
    description = "Public Subnet in us-east-1b"
}

variable "subnets_public" {
    type = map(string)
    description = "Set of public subnets"
}

variable "subnets_private" {
    type = map(string)
    description = "Set of private subnets"
} */