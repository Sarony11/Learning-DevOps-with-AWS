# Learning-DevOps-with-AWS
This repor contains freelabs for setting up an entire workflow and DevOps environment from a real-world perspective in AWS. Repo based on https://github.com/AWS-Devops-Projects/DevOps-The-Hard-Way-AWS.

## Purpose
The main goal of this project is to understand how to use the different application stack used in any company making use of DevOps practices. We will only work on this project from the architecture, infrastructure point of view, abstracting us from the code (this will be given by developoers, not made from us).

The final purpose is to feel confidence facing new working project as IaaC deployed in Cloud and using containerized applications.
## Scenario
You are the main DevOps Engineer in charge of a company who is facing a transformation from very monolithic application to a more microservices architecture.

You have been requested to start this transition migrating to microservices a simple fronted app that logs agains an API login service. You will be on charge the provide the networking architecture, build the microservice infrastructure and deploy the containerized app everything though a CI/CD pipeline and managing all those componentes as code.
## Application
The solution is to deploy the Uber API for the sign-up page. Currently this solution is sitting on a bunch of baremetal, but it's time to sprinkle a little DevOps on it.

https://github.com/AWS-Devops-Projects/DevOps-The-Hard-Way-AWS/raw/main/images/uber.png

As a DevOps Engineer, you're more or less (most likely) not writing the app, but instead, deploying it. That's why you're not writing your own app in this tutorial.

Full Disclosure - I did have to edit this app a bit from Uber to make it compatible with Python3. You can find the repo here:

https://github.com/AdminTurnedDevOps/Python-Sample-Application

## Techonology Stack
### 1 AWS
AWS will be our cloud plataform where to build the whole infrastructure. We are going to use resources like VPCs, subnets, ECR, IAM roles&policies and finally, a EKS cluster.

But we are not going to enter to the AWS console but to use the CLI though Terraform to build the whole project.

### 2 Terraform
Terraform is going to be our IaaC application. Using Terraform we are going to keep track of changes, state and we are going to deploy all the infrastructure though this impressibe tool.

### 3 Github
Github will be our source of truth and where we are going to push all changes regarding terraform, docker, kubernetes code and the **main stone to automate CI/DD though Github Actions**.

### 4 Docker
We are going to use docker to create our Docker image and we will store it making use of ECR in AWS.

### 5 Kubernetes
Kubernetes will be used to run our Docker image. In this case, we will use EKS as the infrastructure where to orchestrate the container.

### 8 Testing automation
Finally, we are going to also apply an automatic terraform code testing app called Checkov. This will help us to keep our terraform code verified.

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


## Docker
In this section we are going to build and create a docker image which is going to contain our app code using a Dockerfile. Later, we will update this image to our AWS ECR preciously created repository.
- [Adding the code repo a a submodule](https://github.com/Sarony11/Learning-DevOps-with-AWS/blob/main/docker/1.add%20submodule.md)
- [Creating and building the docker image](https://github.com/Sarony11/Learning-DevOps-with-AWS/blob/main/docker/2.creating%20docker%20image.md)
- [Pushing the image to AWS ECR](https://github.com/Sarony11/Learning-DevOps-with-AWS/blob/main/docker/3.push%20image%20to%20ECR.md)

## Kubernetes
In this section we are going to connect with the EKS cluster created with terraform and deploy our Docker image pushed in our AWS ECR.
- Connect to EKS from terminal
- Create kubernetes manifest