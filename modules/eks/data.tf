data "aws_subnet" "public-01" {
    filter {
        name = "tag:Name"
        values = ["${local.project_name}-${local.infra_env}-public-subnet-1"]
    }
}

data "aws_subnet" "public-02" {
    filter {
        name = "tag:Name"
        values = ["${local.project_name}-${local.infra_env}-public-subnet-2"]
    }
}

data "aws_subnet" "private-03" {
    filter {
        name = "tag:Name"
        values = ["${local.project_name}-${local.infra_env}-private-subnet-3"]
    }
}

data "aws_subnet" "private-04" {
    filter {
        name = "tag:Name"
        values = ["${local.project_name}-${local.infra_env}-private-subnet-4"]
    }
}