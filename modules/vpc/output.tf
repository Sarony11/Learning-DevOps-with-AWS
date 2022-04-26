output "azs" {
  value = data.aws_availability_zones.azs.names
}

output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.vpc.id
}

output "vpc_cidr" {
    description = "VPC ID"
    value = aws_vpc.vpc.cidr_block
}

output "public_subnets" {
  # Result is a map of subnet id to cidr block.depends_on = [
  # { "subnet 1234" => "10.0.1.0/4", ... }
    value = {
        for subnet in aws_subnet.public :
        subnet.id => subnet.cidr_block
    }
}

output "private_subnets" {
    value = {
        for subnet in aws_subnet.private :
        subnet.id => subnet.cidr_block
    }
}