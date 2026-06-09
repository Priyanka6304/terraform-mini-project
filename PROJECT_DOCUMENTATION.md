# Terraform Mini Project – Deploying Two EC2 Instances in a Manually Created AWS VPC Using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS resources. The networking components were created manually in AWS Console, and the EC2 instances were provisioned using Terraform.

The project includes:

* Manual VPC Creation
* Public Subnet Creation
* Internet Gateway Configuration
* Route Table Configuration
* Security Group Configuration
* S3 Backend for Terraform State Management
* Terraform Variables and Outputs
* User Data Scripts
* Deployment of Two EC2 Instances

---

# Project Objective

The objective of this project is to understand:

* Terraform Fundamentals
* Infrastructure as Code (IaC)
* AWS Networking Components
* Remote State Management using S3
* EC2 Provisioning using Terraform
* Variable Management
* Troubleshooting Real-Time Deployment Issues

---

# Project Approach

This project follows a hybrid implementation approach.

- AWS networking resources such as VPC, Public Subnets, Internet Gateway, Route Table, Security Group, S3 Backend Bucket, and Key Pair were created manually using AWS Console.
- Terraform was used for infrastructure automation, including EC2 provisioning, variable management, outputs, user data scripts, and remote state configuration.
- The objective was to gain hands-on experience with both AWS Console operations and Terraform automation.
- This approach helped in understanding the relationship between manually created AWS infrastructure and Terraform-managed resources.

---

# Development Environment

This project can be executed using:

* Visual Studio Code
* MobaXterm
* Git Bash
* Linux Terminal
* AWS CloudShell

### Note

Most trainers perform Terraform projects using MobaXterm on Linux servers.

For this implementation, the project was completed using:

**Visual Studio Code on Windows**

All Terraform commands were executed from the VS Code integrated terminal.

---

# Architecture Overview

## Manually Created AWS Resources

* VPC
* Public Subnet 1
* Public Subnet 2
* Internet Gateway
* Route Table
* Security Group
* S3 Bucket
* EC2 Key Pair

## Terraform Managed Resources

* EC2 Instance 1
* EC2 Instance 2
* User Data Scripts
* Terraform Outputs

---

# Phase 1 – Manual AWS Infrastructure Setup

## Step 1 – Create VPC

AWS Console → VPC → Create VPC

Configuration:

```text
Name: terraform-vpc
CIDR Block: 10.0.0.0/16
Region: ap-south-1
```

---

## Step 2 – Create Public Subnets

### Public Subnet 1

```text
Name: terraform-public-subnet-1
CIDR: 10.0.1.0/24
Availability Zone: ap-south-1a
```

### Public Subnet 2

```text
Name: terraform-public-subnet-2
CIDR: 10.0.2.0/24
Availability Zone: ap-south-1b
```

---

## Step 3 – Create Internet Gateway

AWS Console → Internet Gateways

```text
Name: terraform-igw
```

Attach Internet Gateway to the VPC.

---

## Step 4 – Create Route Table

AWS Console → Route Tables

Create Route:

```text
Destination: 0.0.0.0/0
Target: Internet Gateway
```

Associate both public subnets with the route table.

---

## Step 5 – Create Security Group

AWS Console → Security Groups

Inbound Rules:

```text
SSH  - TCP - Port 22 - 0.0.0.0/0

HTTP - TCP - Port 80 - 0.0.0.0/0
```

Outbound Rules:

```text
All Traffic
```

---

## Step 6 – Create S3 Backend Bucket

AWS Console → S3

Create Bucket:

```text
Bucket Name: priyanka-terraform-state
Region: ap-south-1
```

Purpose:

```text
Terraform Remote State Storage
```

---

## Step 7 – Create EC2 Key Pair

AWS Console → EC2 → Key Pairs

Create:

```text
Key Pair Name: personalkeypair
Type: RSA
Format: .pem
```

Download and securely store the PEM file.

---

# Phase 2 – Terraform Installation

## Download Terraform

Downloaded:

```text
terraform_1.15.5_windows_amd64.zip
```

Extracted Terraform executable.

Added Terraform executable path to Windows Environment Variables.

Verification:

```bash
terraform version
```

---

# Phase 3 – AWS CLI Installation

Downloaded and installed AWS CLI.

Verification:

```bash
aws --version
```

Configured AWS Credentials:

```bash
aws configure
```

Provided:

```text
AWS Access Key
AWS Secret Access Key
Default Region: ap-south-1
Output Format: json
```

Verification:

```bash
aws sts get-caller-identity
```

Successfully authenticated IAM user.

---

# Phase 4 – Terraform Project Structure

```text
terraform/

├── backend.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── output.tf
├── userdata.sh
├── userdata1.sh
├── README.md
├── PROJECT_DOCUMENTATION.md
└── .gitignore
```

---

# backend.tf

```hcl
terraform {
  backend "s3" {
    bucket       = "priyanka-terraform-state"
    key          = "prod/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
```

---

# provider.tf

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```

---

# variables.tf

Variables Created:

```text
aws_region
ami
instance_type
key_name
subnet_id_1
subnet_id_2
security_group_id
project_name
```

---

# terraform.tfvars

```hcl
aws_region       = "ap-south-1"
ami              = "ami-0db56f446d44f2f09"
instance_type    = "t3.micro"
key_name         = "personalkeypair"
subnet_id_1      = "subnet-09efcb1dbf194d0c9"
subnet_id_2      = "subnet-099eca893f9248f93"
security_group_id = "sg-08dc4def3f8ed943f"
project_name     = "TERRAFORM"
```

---

# output.tf

Outputs Configured:

```text
Server1 Instance ID
Server1 Public IP
Server1 Public DNS

Server2 Instance ID
Server2 Public IP
Server2 Public DNS
```

---

# userdata.sh

Purpose:

```text
Install Apache Web Server

Deploy Web Page

Display Server 1 Details
```

---

# userdata1.sh

Purpose:

```text
Install Apache Web Server

Deploy Web Page

Display Server 2 Details
```

---

# Terraform Commands Executed

## Format Code

```bash
terraform fmt
```

## Validate Configuration

```bash
terraform validate
```

## Initialize Terraform

```bash
terraform init
```

## Generate Execution Plan

```bash
terraform plan
```

## Deploy Infrastructure

```bash
terraform apply
```

Enter:

```text
yes
```

---

# Real-Time Issues Faced and Troubleshooting

## Issue 1

Error:

```text
'terraform' is not recognized as an internal or external command
```

Cause:

Terraform executable path not added.

Resolution:

Added Terraform path to Environment Variables.

---

## Issue 2

Error:

```text
No valid credential sources found
```

Cause:

AWS CLI not installed and credentials not configured.

Resolution:

Installed AWS CLI and executed:

```bash
aws configure
```

---

## Issue 3

Error:

```text
InvalidSubnetID.NotFound
```

Cause:

Incorrect subnet ID used.

Resolution:

Verified subnet IDs from AWS Console and updated terraform.tfvars.

---

## Issue 4

Error:

```text
InvalidKeyPair.NotFound
```

Cause:

Terraform used:

```text
MyKey
```

Actual Key Pair:

```text
personalkeypair
```

Resolution:

Updated terraform.tfvars.

---

## Issue 5

Error:

```text
Specified instance type is not eligible for Free Tier
```

Cause:

AMI and launch configuration mismatch.

Resolution:

Verified manually launched EC2 instance and updated AMI.

---

## Issue 6

Error:

```text
Security group and subnet belong to different networks
```

Cause:

Security Group belonged to Default VPC.

Resolution:

Used Security Group from the same custom VPC as the subnets.

---

## Issue 7

Error:

```text
git is not recognized as an internal or external command
```

Cause:

Git was not installed.

Resolution:

Installed Git for Windows and configured Git credentials.

---
# Final Successful Deployment

Terraform deployment completed successfully.

Terraform Apply Summary:

```text
Plan: 2 to add, 0 to change, 0 to destroy.

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

### Server 1

```text
Instance ID:
i-0c54c56bd85a05bd7

Public IP:
43.205.255.11
```

### Server 2

```text
Instance ID:
i-0d449f9e0db2b3884

Public IP:
3.110.92.25
```

The EC2 instances were successfully launched within the manually created AWS VPC using Terraform.

---

# Deployment Verification

The deployed web servers were verified through browser access.

### Server 1

Accessed:

```text
http://43.205.255.11
```

Output Verified:

```text
Terraform Project Server 1
Welcome to Terraform Mini Project
```

### Server 2

Accessed:

```text
http://3.110.92.25
```

Output Verified:

```text
Terraform Project Server 2
Welcome to Terraform Training Project
```


---

# GitHub Repository

Repository URL:

https://github.com/Priyanka6304/terraform-mini-project

# GitHub Repository Upload Steps

## Initialize Repository

```bash
git init
```

## Add Files

```bash
git add .
```

## Commit Changes

```bash
git commit -m "Terraform Mini Project - Manual VPC with 2 EC2 Instances"
```

## Rename Branch

```bash
git branch -M main
```

## Add Remote Repository

```bash
git remote add origin https://github.com/Priyanka6304/terraform-mini-project.git
```

## Push Code

```bash
git push -u origin main
```

---

# Cost Optimization and Cleanup

To avoid AWS charges after project completion:

```bash
terraform destroy
```

Enter:

```text
yes
```

Terraform will remove:

* EC2 Instance 1
* EC2 Instance 2

---

# Backend Cleanup

If the project is no longer required:

1. Empty S3 Bucket

```text
priyanka-terraform-state
```

2. Delete:

```text
terraform.tfstate
terraform.tfstate.backup
```

3. Delete S3 Bucket (Optional)

-----

# Final Deliverables Submitted

* Terraform Source Code
* GitHub Repository
* README.md
* PROJECT_DOCUMENTATION.md
* Terraform Apply Output
* Project Verification Details

---

# Learning Outcomes

* Terraform Fundamentals
* Infrastructure as Code (IaC)
* AWS Networking
* Remote State Management using S3
* EC2 Provisioning
* Terraform Variables
* Terraform Outputs
* GitHub Version Control
* Troubleshooting and Debugging
* End-to-End Terraform Deployment

---

# Project Evidence

The project was successfully implemented, validated, and tested using AWS and Terraform.

Validation activities included:

* Terraform initialization
* Terraform validation
* Terraform planning
* Terraform deployment
* EC2 instance provisioning
* AWS Console verification
* Browser-based web server testing
* GitHub repository integration
* Terraform resource cleanup

Note:

Screenshots were not retained after project completion and infrastructure cleanup.

---

# Conclusion

Successfully implemented a Terraform Mini Project using Terraform and AWS. The project demonstrated complete lifecycle management of cloud infrastructure, including planning, provisioning, validation, troubleshooting, deployment, verification, GitHub integration, and cleanup while following Infrastructure as Code (IaC) best practices.

---

# Author

Priyanka

Terraform Mini Project

AWS | Terraform | Infrastructure as Code (IaC)
