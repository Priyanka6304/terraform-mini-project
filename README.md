# Terraform Mini Project - Deploying Two EC2 Instances in a Manually Created AWS VPC

## Project Status

✅ Completed

Terraform Mini Project successfully deployed, verified, documented, and uploaded to GitHub.

AWS | Terraform | Infrastructure as Code (IaC)

This project demonstrates Infrastructure as Code (IaC) using Terraform on AWS. The networking infrastructure was created manually in AWS Console, and Terraform was used to provision two EC2 instances inside a custom VPC. The project also implements remote state management using Amazon S3.

---

# Project Overview

The project covers:

* Terraform Installation and Configuration
* AWS CLI Configuration
* Remote State Management using Amazon S3
* Terraform Variables and Outputs
* EC2 Provisioning
* User Data Scripts
* Infrastructure as Code (IaC)
* Troubleshooting Real-Time Deployment Issues
* GitHub Integration and Version Control

---

# Key Features

* Manual AWS Network Infrastructure Setup
* Remote Terraform State Management using S3
* Infrastructure as Code (IaC)
* Automated EC2 Provisioning
* User Data Automation
* Centralized Variable Management
* Terraform Outputs
* GitHub Version Control
* Real-Time Troubleshooting Documentation

---

# AWS Services Used

* Amazon VPC
* Public Subnets
* Internet Gateway
* Route Table
* Security Group
* Amazon EC2
* Amazon S3
* AWS IAM
* Terraform

---

# Architecture

## Manually Created Resources

* VPC
* Public Subnet 1
* Public Subnet 2
* Internet Gateway
* Route Table
* Security Group
* S3 Backend Bucket
* EC2 Key Pair

## Terraform Managed Resources

* EC2 Instance 1
* EC2 Instance 2
* User Data Scripts
* Terraform Outputs

---

# Architecture Diagram

```text
                    Internet
                        |
                Internet Gateway
                        |
                  Route Table
                        |
       --------------------------------
       |                              |
 Public Subnet 1               Public Subnet 2
       |                              |
 EC2 Server 1                  EC2 Server 2
       |                              |
       --------------------------------
                    Custom VPC
                        |
                Terraform Backend
                        |
                   S3 Bucket
```

---

# Project Workflow

```text
Manual AWS Setup
      ↓
Create S3 Backend Bucket
      ↓
Configure AWS CLI
      ↓
Write Terraform Configuration Files
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform init
      ↓
terraform plan
      ↓
terraform apply
      ↓
Verify EC2 Instances
      ↓
Push Project to GitHub
      ↓
terraform destroy
```

---

# Project Structure

```text
terraform/

├── backend.tf
├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── output.tf
├── userdata.sh
├── userdata1.sh
├── README.md
├── PROJECT_DOCUMENTATION.md
├── screenshots/
└── .gitignore
```

---

# Backend Configuration

Terraform remote state is stored in Amazon S3.

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

# Terraform Commands

## Format Terraform Files

```bash
terraform fmt
```

## Validate Terraform Configuration

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

Type:

```text
yes
```

## Destroy Infrastructure

```bash
terraform destroy
```

Type:

```text
yes
```

---

# AWS CLI Commands Used

## Verify AWS CLI

```bash
aws --version
```

## Configure AWS Credentials

```bash
aws configure
```

## Verify IAM Authentication

```bash
aws sts get-caller-identity
```

## Verify Subnets

```bash
aws ec2 describe-subnets --region ap-south-1
```

## Verify Key Pairs

```bash
aws ec2 describe-key-pairs --region ap-south-1
```

---

# Deployment Result

Terraform successfully provisioned two EC2 instances.

## Server 1

* Instance ID: i-0c54c56bd85a05bd7
* Public IP: 43.205.255.11

## Server 2

* Instance ID: i-0d449f9e0db2b3884
* Public IP: 3.110.92.25

---

# Verification

### Server 1

```text
http://43.205.255.11
```

Expected Output:

```text
Terraform Project Server 1
Welcome to Terraform Mini Project
```

### Server 2

```text
http://3.110.92.25
```

Expected Output:

```text
Terraform Project Server 2
Welcome to Terraform Training Project
```

---

# Project Evidence

The project was successfully implemented, tested, and validated in AWS Cloud.

The following activities were completed during project execution:

* Manual VPC creation in AWS Console
* Public Subnet creation
* Internet Gateway attachment
* Route Table configuration
* Security Group creation
* S3 Backend Bucket creation
* AWS CLI configuration
* Terraform initialization
* Terraform validation
* Terraform planning
* Terraform deployment
* EC2 Instance provisioning
* User Data script execution
* Web Server verification
* GitHub repository integration
* Terraform resource cleanup

Verification was performed through:

* AWS Console resource validation
* Terraform command outputs
* EC2 instance status checks
* Browser-based web server testing
* GitHub repository review

Note: Screenshots were not retained during project cleanup and are therefore not included in this repository.

---

# Real-Time Challenges Faced

| Issue                             | Resolution                                               |
| --------------------------------- | -------------------------------------------------------- |
| Terraform command not recognized  | Added Terraform executable path to Environment Variables |
| AWS CLI command not recognized    | Installed AWS CLI and restarted terminal                 |
| No valid credential sources found | Configured AWS credentials using aws configure           |
| Invalid Subnet ID                 | Verified subnet IDs from AWS Console                     |
| Invalid Key Pair                  | Updated key pair name in terraform.tfvars                |
| Security Group mismatch           | Used Security Group from the same VPC                    |
| Git authentication failure        | Configured GitHub authentication successfully            |

---

# GitHub Repository

Repository URL:

https://github.com/Priyanka6304/terraform-mini-project

---

# Development Environment

This project can be executed using:

* Visual Studio Code
* MobaXterm
* Git Bash
* Linux Terminal
* AWS CloudShell

For this implementation, Visual Studio Code on Windows was used.

---

# Software Versions

| Component        | Version            |
| ---------------- | ------------------ |
| Terraform        | 1.15.5             |
| AWS Provider     | 6.x                |
| AWS CLI          | Latest             |
| Operating System | Windows 10         |
| IDE              | Visual Studio Code |
| AWS Region       | ap-south-1         |

---

# Cleanup Procedure

To avoid unnecessary AWS charges after project completion:

```bash
terraform destroy
```

Type:

```text
yes
```

Terraform removes:

* EC2 Instance 1
* EC2 Instance 2

After destroying Terraform resources:

1. Delete objects from the S3 backend bucket.
2. Delete the S3 bucket (optional).
3. Delete manually created resources:

   * Security Group
   * Route Table
   * Internet Gateway
   * Subnets
   * VPC

---

# Future Enhancements

The following AWS services can be integrated to extend this project into a production-ready architecture:

* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Amazon RDS
* NAT Gateway
* CloudWatch Monitoring
* DynamoDB State Locking
* Terraform Modules
* CI/CD Pipeline using Jenkins or GitHub Actions

---

# Learning Outcomes

* Terraform Fundamentals
* Infrastructure as Code (IaC)
* AWS Networking
* EC2 Provisioning
* Remote State Management using S3
* Variables and Outputs
* GitHub Version Control
* Troubleshooting Terraform Deployments
* Infrastructure Lifecycle Management

---

# Skills Demonstrated

## Cloud Skills

* Amazon VPC Management
* Public Subnet Configuration
* Internet Gateway Configuration
* Route Table Management
* Security Group Management
* Amazon EC2 Administration
* Amazon S3 Backend Configuration
* AWS IAM Authentication
* AWS CLI Operations

## Terraform Skills

* Infrastructure as Code (IaC)
* Terraform State Management
* Remote Backend Configuration
* Terraform Variables
* Terraform Outputs
* User Data Automation
* Resource Provisioning
* Infrastructure Lifecycle Management

## DevOps Skills

* Git Version Control
* GitHub Repository Management
* Linux Administration
* Troubleshooting and Debugging
* Documentation and Reporting
* Cloud Infrastructure Deployment

## Professional Skills

* Problem Solving
* Troubleshooting Real-Time Issues
* Infrastructure Planning
* Technical Documentation
* Project Execution

---

# Author

Priyanka

Terraform Mini Project

AWS | Terraform | Infrastructure as Code (IaC)

---

# Conclusion

Successfully implemented a Terraform Mini Project using AWS and Terraform. The project demonstrated complete infrastructure lifecycle management including planning, provisioning, validation, troubleshooting, deployment, verification, GitHub integration, and cleanup while following Infrastructure as Code best practices.
