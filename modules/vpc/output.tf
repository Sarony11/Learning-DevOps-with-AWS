output "azs" {
  value = data.aws_availability_zones.azs
}

output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.vpc.id
}

output "vpc_cidr" {
    description = "VPC ID"
    value = aws_vpc.vpc.cidr_block
}