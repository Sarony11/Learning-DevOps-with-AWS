resource "aws_instance" "aws_devops_web" {
    ami = var.instance_ami
    instance_type = var.instance_type
    #subnet_id = "subnet-09fac6f5c09a57d69"

    root_block_device {
      volume_size = var.instance_root_volume_size
      volume_type = "gp3"
    }

    tags = {
        Name = "${var.project_name}-${var.infra_env}-web"
        Role = var.infra_role
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        ManagedBy = "terraform"
    }
}

resource "aws_eip" "aws_devops_web_eip" {
    vpc = true
    /* lifecycle {
        prevent_destroy = true
    } */
    tags = {
        Name = "${var.project_name}-${var.infra_env}-web-eip"
        Role = var.infra_role
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        ManagedBy = "terraform"
    }
}

resource "aws_eip_association" "aws_devops_web_eip_association" {
    allocation_id = aws_eip.aws_devops_web_eip.id
    instance_id = aws_instance.aws_devops_web.id
    /* tags {
        Name = "${var.project_name}-${var.infra_env}-web-eip-association"
        Role = var.infra_role
        Project = "https://github.com/Sarony11/Learning-DevOps-with-AWS"
        Environment = var.infra_env
        ManagedBy = "terraform"
    } */
}