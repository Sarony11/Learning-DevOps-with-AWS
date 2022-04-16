# Configure the AWS Provider
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

# Configure GitHub account
/* provider "github" {

    owner = "moodysanalytics"
    token = var.github_token

}
 */