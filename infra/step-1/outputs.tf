
output "aws_availability_zones" {
    description = "List of availability zones"
    value = module.vpc.azs
}

output "vpc_id" {
    description = "VPC ID"
    value = module.vpc.vpc_id
}

output "vpc_cidr" {
    value = module.vpc.vpc_cidr
}

/* output "public_subnets" {
    value = {
        for subnet in aws_subnet.public :
        module.vpc.subnet.id => module.vpc.subnet.cidr_block
    }
}

output "private_subnets" {
    value = {
        for subnet in aws_subnet.private :
        module.vpc.subnet.id => module.vpc.subnet.cidr_block
    }
} */