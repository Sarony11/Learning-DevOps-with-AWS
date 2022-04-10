# Configure the AWS Provider
provider "aws" {
  profile = "sarony11"
  region  = "us-east-1"
}

# Configure GitHub account
provider "github" {

    owner = "moodysanalytics"
    token = var.github_token

}
