# Deploying a Static Website to S3 using Terraform
## Description
This is a project that uses terroform to provision an s3 bucket setup bucket policies, ACLs and host a static website on it.

## Pre-requisite
- Must have terraform
[Installed](https://developer.hashicorp.com/terraform/install)
- Must have AWS CLI [Installed](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) configure the cli
- Also make sure the security credentials used has the neccessary s3 bucket permissions

## Provision Resource
    1. Initialize Terraform: 
`terraform init`

    2. Validate Configuration:

`terraform validate`

    3. Plan and Apply:

`terraform plan`    
`terraform apply`