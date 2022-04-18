/* 
README
Before applying this backend, we need to have the state bucket already created. For this reason, we need to comment this file,
create the bucket, uncomment it again and finally, apply.
STEP BY STEP
1. Comment terraform section
2. terraform init && terraform apply --auto-approve
3. Uncomment terraform section
4. terraform init && terraform apply --auto-approve 
*/

terraform {

    backend "s3" {

        profile = "sarony11"
        region  = "us-east-1"
        bucket  = "aws-devops-dev-tfstate"
        key     = "init-terraform.tfstate"
        dynamodb_table = "aws-devops-dev-terraform-state-locking"
        /* encrypt = true */
    }

}