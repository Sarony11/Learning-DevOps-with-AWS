# Learning-DevOps-with-AWS
This repor contains freelabs for setting up an entire workflow and DevOps environment from a real-world perspective in AWS. Repo based on https://github.com/AWS-Devops-Projects/DevOps-The-Hard-Way-AWS.

## Techonology Stack

## Step by Step
### 1. Terraform and AWS configuration
 #### 1.1 AWS credentials
   First of all we need to setup AWS credentials. These credentials cannot be hardcoded or exposed in the repo.
   
   1.1.1 [Configure AWS profile locally](https://docs.aws.amazon.com/toolkit-for-visual-studio/latest/user-guide/keys-profiles-credentials.html)
   
   1.1.2 [Configure providers.tf](https://github.com/Sarony11/Learning-DevOps-with-AWS/commit/981b956758421770ccc5837f662ceb4877458dcd)
### 2. Configure Terraform Remote State on S3 Bucket
Terraform uses a state to manage what is the real situation with the deployed resources. We are use to the local state, but this is not possible if we work in a remote environment with more than 1 people.

For this reason, we firs need to move the terraform state to a remote environment, accessible for the team in order to the whole team is able to work with the exact same state.

For this to happen, we need first of all to create a bucket in AWS where we will move the state and this has to happen in two separate steps, otherwise, the state will not find the bucket created to move the state.

 #### 2.1 Create the bucket
 We create the file [0-s3-state.tf](https://github.com/Sarony11/Learning-DevOps-with-AWS/blob/main/aws/0-s3-state.tf) with:

 ```
 resource "aws_s3_bucket" "tf-state-bucket"{
    bucket = "sarony11-tfstates-638492"
}
```
```
terraform init
terraform plan
terraform apply
```
This will create the bucket.
 #### 2.2 Create the backend & encrypt it
 https://www.youtube.com/watch?v=QHfI3NRedIg

### 3. Creating VPC and subnets
The next step is to create the VPC and the subnets. We want to create a VPC with 2 public subnets (subnets with internet access) and 2 private subnets (subnets with no internet connectivity)

To do it, we will create a terraform module.

Resources:
- [What is a cidr](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
- [Visual Subnet Calculator](https://www.davidc.net/sites/default/subnets/subnets.html)
- [Creating module for VPC and subnets](https://www.youtube.com/watch?v=IpN0ZiXmufM)
- [What are VPCs in AWS youtube list explained by CloudCast](https://www.youtube.com/watch?v=Ix58fYcnbVc&list=PLI8rNSktL2DRJ-NtEYS4wT3OEGqxLtwBY)

#### 3.1 Creating a VPC
The VPC is the main element that will contain the subnets. For now, we are going to hardcode the VPC cidr to be "10.0.0.0/17" and environment to "dev" in our [1-vpc.tf](https://github.com/Sarony11/Learning-DevOps-with-AWS/blob/main/aws/1-vpc.tf).

To find where is the module, we specify the route in the 