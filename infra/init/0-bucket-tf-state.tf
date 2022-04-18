# Creates the tf state bucket
resource "aws_s3_bucket" "tf-state"{
    bucket = local.bucket_backend_name
    tags = {
        Name = "${local.project_name}-${local.infra_env}-tfstate-bucket"
        Project = local.project_name
        Repository = local.project_repo
        Environment = local.infra_env
        ManagedBy = "terraform"
        Role = "terraform-state"
    }
    /* server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    } */
}

# We create an ACL policy to make the bucket private
resource "aws_s3_bucket_acl" "private-acl" {
  bucket = aws_s3_bucket.tf-state.id
  acl    = "private"
}

# Enable bucket versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.tf-state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# This creates a dynamodb table to save the lock state
resource "aws_dynamodb_table" "terraform_locks" {
    name = "${local.project_name}-${local.infra_env}-terraform-state-locking"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name = "${local.project_name}-${local.infra_env}-tfstate-bucket"
        Project = local.project_name
        Repository = local.project_repo
        Environment = local.infra_env
        ManagedBy = "terraform"
        Role = "terraform-state-lock"
    }
}