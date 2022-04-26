# Internet Gateway (IGW)
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        Name = "${var.project_name}-${var.infra_env}-eip"
        Project = var.project_name
        Repository = var.project_repo
        Environment = var.infra_env
        VPC = aws_vpc.vpc.id
        ManagedBy = "terraform"
    }
}

# NAT Gateway (NGW) components
# NAT needs an elastic ip address associated to it. In this code, we define this elasticIP
resource "aws_eip" "nat-eip" {
    vpc = true
    depends_on = [
      aws_internet_gateway.igw
    ]
   /* lifecycle {
      prevent_destroy = true
    }  */

    tags = {
        Name = "${var.project_name}-${var.infra_env}-eip"
        Project = var.project_name
        Repository = var.project_repo
        Environment = var.infra_env
        VPC = aws_vpc.vpc.id
        ManagedBy = "terraform"
        Role = "private"
    }
}

# NAT Gateway (NGW)
resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.nat-eip.id
    subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id

    tags = {
        Name = "${var.project_name}-${var.infra_env}-eip"
        Project = var.project_name
        Repository = var.project_repo
        Environment = var.infra_env
        VPC = aws_vpc.vpc.id
        ManagedBy = "terraform"
        Role = "private"
    }
}

# Route Tables and Routes
resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        # Public route to the internet
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
  }
    tags = {
        Name = "${var.project_name}-${var.infra_env}-public-eip"
        Project = var.project_name
        Repository = var.project_repo
        Environment = var.infra_env
        VPC = aws_vpc.vpc.id
        ManagedBy = "terraform"
    }
}

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.vpc.id
    route {
        # Private route to the NAT gateway
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ngw.id
    }
    tags = {
        Name = "${var.project_name}-${var.infra_env}-private-eip"
        Project = var.project_name
        Repository = var.project_repo
        Environment = var.infra_env
        VPC = aws_vpc.vpc.id
        ManagedBy = "terraform"
    }
}

resource "aws_main_route_table_association" "principal_public_route_table_association" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.public-rt.id
}