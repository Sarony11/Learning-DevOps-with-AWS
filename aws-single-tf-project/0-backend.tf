/* terraform {

    backend "s3" {

        profile = var.aws_profile
        region  = var.aws_region
        bucket  = var.backend_bucket
        key     = "repo/personal/learning-devops-with-aws/terraform.tfstate"
        dynamodb_table = "terraform-state-locking"
        encrypt = true
    }

}

resource "aws_s3_bucket" "tf-state-bucket"{
    bucket = "sarony11-tfstates-638492"

    lifecycle {
        prevent_destroy = false
    }

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terraform-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
} */