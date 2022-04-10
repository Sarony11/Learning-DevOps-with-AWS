terraform {

    backend "s3" {

        profile = "sarony11"
        region  = "us-east-1"
        bucket  = "sarony11-tfstates-638492"
        key     = "repo/personal/learning-devops-with-aws/terraform.tfstate"
        dynamodb_table = "terraform-state-locking"
        encrypt = true
    }

}