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

data "aws_subnets" "public" {
    filter {
        name = "tag:Name"
        values = ["${local.project_name}-${local.infra_env}-public-subnet-*"]
    }
}

data "aws_subnet" "public" {

    count = length(data.aws_subnets.public.ids)

    id = data.aws_subnets.public.ids[ count.index ]

}

data "aws_subnets" "private" {
    filter {
        name = "tag:Name"
        values = ["${local.project_name}-${local.infra_env}-private-subnet-*"]
    }
}

data "aws_subnet" "private" {

    count = length(data.aws_subnets.private.ids)

    id = data.aws_subnets.private.ids[ count.index ]

}