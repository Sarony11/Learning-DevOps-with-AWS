/* variable "aws_region" {
    type = string
    description = "AWS region"
    default = "us-east-1"
}

variable "aws_profile" {
    type = string
    description = "AWS CLI local profile"
}
 */
variable "infra_env" {
    type = string
    description = "Infrastructure environment"
}

variable "infra_role" {
    type = string
    description = "Infrastructure role"
}

variable "project_name" {
    type = string
    description = "Project name"
}

/* variable "backend_bucket" {
    type = string
    description = "S3 bucket to store Terraform state"
}

variable "backend_bucket_key" {
    type = string
    description = "S3 key to store Terraform state"
}
 */
variable "instance_type" {
    type = string
    description = "EC2 instance type"
    default = "t2.micro"
}

variable "instance_ami" {
    type = string
    description = "EC2 instance AMI"
    default = "ami-0728c899d77719160"
}

variable "instance_root_volume_size" {
    type = string
    description = "EC2 instance root volume size"
    default = "8"
}