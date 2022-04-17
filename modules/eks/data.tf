data "aws_subnet" "public-1" {
    filter {
        name = "tag:Name"
        values = ["aws-devops-dev-public-subnet"]
    }
    filter {
        name = "tag:Subnet"
        values = ["us-east-1a-1"]
    }
}

data "aws_subnet" "public-2" {
    filter {
        name = "tag:Name"
        values = ["aws-devops-dev-public-subnet"]
    }
    filter {
        name = "tag:Subnet"
        values = ["us-east-1b-2"]
    }
}

data "aws_subnet" "private-3" {
    filter {
        name = "tag:Name"
        values = ["aws-devops-dev-private-subnet"]
    }
    filter {
        name = "tag:Subnet"
        values = ["us-east-1a-3"]
    }
}

data "aws_subnet" "private-4" {
    filter {
        name = "tag:Name"
        values = ["aws-devops-dev-private-subnet"]
    }
    filter {
        name = "tag:Subnet"
        values = ["us-east-1b-4"]
    }
}