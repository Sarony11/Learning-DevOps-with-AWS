terraform {

    backend "s3" {

        profile = "sarony11"
        region  = "us-east-1"
        bucket  = "aws-devops-dev-tfstate"
        key     = "step1-terraform.tfstate"
        dynamodb_table = "aws-devops-dev-terraform-state-locking"
        /* encrypt = true */
    }

}