# Internet Gateway (IGW)
resource "aws_internet_gateway" "aws-devops-igw" {
    vpc_id = aws_vpc.aws-devops-vpc.id

    tags = {
        Name = "aws-devops-${var.infra_env}-igw"
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        VPC = aws_vpc.aws-devops-vpc.id
        ManagedBy = "terraform"
    }
}

# NAT Gateway (NGW) components
# NAT needs an elastic ip address associated to it. In this code, we define this elasticIP
resource "aws_eip" "aws-devops-nat-eip" {
    vpc = true

   /*  lifecycle {
      prevent_destroy = true
    } */

    tags = {
        Name = "aws-devops-${var.infra_env}-eip"
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        VPC = aws_vpc.aws-devops-vpc.id
        ManagedBy = "terraform"
        Role = "private"
    }
}

# NAT Gateway (NGW)
resource "aws_nat_gateway" "aws-devops-ngw" {
    allocation_id = aws_eip.aws-devops-nat-eip.id
    subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id

    tags = {
        Name = "aws-devops-${var.infra_env}-ngw"
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        VPC = aws_vpc.aws-devops-vpc.id
        ManagedBy = "terraform"
        Role = "private"
    }
}

# Route Tables and Routes
resource "aws_route_table" "aws-devops-public-rt" {
    vpc_id = aws_vpc.aws-devops-vpc.id

    tags = {
        Name = "aws-devops-${var.infra_env}-public-rt"
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        VPC = aws_vpc.aws-devops-vpc.id
        ManagedBy = "terraform"
    }
}

resource "aws_route_table" "aws-devops-private-rt" {
    vpc_id = aws_vpc.aws-devops-vpc.id

    tags = {
        Name = "aws-devops-${var.infra_env}-private-rt"
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        VPC = aws_vpc.aws-devops-vpc.id
        ManagedBy = "terraform"
    }
}

# Public Route
resource "aws_route" "aws-devops-public-route" {
    route_table_id = aws_route_table.aws-devops-public-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws-devops-igw.id
}

# Private Route
resource "aws_route" "aws-devops-private-route" {
    route_table_id = aws_route_table.aws-devops-private-rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.aws-devops-ngw.id
}