# Configure the AWS Provider
provider "aws" {
  profile = local.aws_profile
  region = local.aws_region
}

# Configure GitHub account
/* provider "github" {

    owner = "moodysanalytics"
    token = var.github_token

}
 */