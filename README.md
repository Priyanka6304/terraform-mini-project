# Terraform Mini Project - Deploying 2 EC2 Instances in a Manually Created AWS VPC

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform on AWS.

The networking infrastructure was created manually in AWS Console, and Terraform was used to provision two EC2 instances inside the custom VPC.

The project covers:

* Terraform Installation
* AWS CLI Configuration
* Remote State Management using S3
* Terraform Variables and Outputs
* EC2 Provisioning
* User Data Scripts
* Troubleshooting Real-Time Deployment Issues
* GitHub Integration

---

## AWS Services Used

* Amazon VPC
* Public Subnets
* Internet Gateway
* Route Table
* Security Group
* Amazon EC2
* Amazon S3
* IAM
* Terraform

---

## Architecture

### Manually Created Resources

* VPC
* Public Subnet 1
* Public Subnet 2
* Internet Gateway
* Route Table
* Security Group
* S3 Backend Bucket
* EC2 Key Pair

### Terraform Managed Resources

* EC2 Instance 1
* EC2 Instance 2
* User Data Scripts
* Outputs

---

## Project Structure

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
└── .gitignore
```

---

## Backend Configuration

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

## Terraform Commands

### Format Terraform Files

```bash
terraform fmt
```

### Validate Configuration

```bash
terraform validate
```

### Initialize Terraform

```bash
terraform init
```

### Generate Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

Type:

```text
yes
```

### Destroy Infrastructure

```bash
terraform destroy
```

Type:

```text
yes
```

---

## AWS CLI Commands Used

### Verify AWS CLI

```bash
aws --version
```

### Configure Credentials

```bash
aws configure
```

### Verify Authentication

```bash
aws sts get-caller-identity
```

### Verify Subnets

```bash
aws ec2 describe-subnets --region ap-south-1
```

### Verify Key Pairs

```bash
aws ec2 describe-key-pairs --region ap-south-1
```

---

## Deployment Result

Terraform successfully provisioned:

### Server 1

* Instance ID: i-0c54c56bd85a05bd7
* Public IP: 43.205.255.11

### Server 2

* Instance ID: i-0d449f9e0db2b3884
* Public IP: 3.110.92.25

---

## Verification

Open in browser:

```text
http://43.205.255.11
```

Expected Output:

```text
Terraform Project Server 1
Welcome to Terraform Mini Project
```

Open in browser:

```text
http://3.110.92.25
```

Expected Output:

```text
Terraform Project Server 2
Welcome to Terraform Training Project
```

---

## Screenshots

Add screenshots in a folder named:

```text
screenshots/
```

Recommended screenshots:

1. VPC Configuration
2. Public Subnets
3. Route Table
4. Internet Gateway
5. Security Group
6. S3 Bucket
7. VS Code Project Structure
8. Terraform Init Output
9. Terraform Plan Output
10. Terraform Apply Output
11. Running EC2 Instances
12. Browser Output - Server 1
13. Browser Output - Server 2

---

## Troubleshooting Highlights

### Issue 1

Terraform not recognized.

Resolution:

Added Terraform executable to Windows Environment Variables.

### Issue 2

AWS CLI not recognized.

Resolution:

Installed AWS CLI and restarted terminal.

### Issue 3

No valid credential sources found.

Resolution:

Configured AWS credentials using:

```bash
aws configure
```

### Issue 4

Invalid Subnet ID.

Resolution:

Verified subnet IDs from AWS Console.

### Issue 5

Invalid Key Pair.

Resolution:

Updated key pair name to:

```text
personalkeypair
```

### Issue 6

Security Group and Subnet belong to different networks.

Resolution:

Used Security Group from the same VPC as the subnets.

---

## GitHub Repository

Repository URL:

```text
https://github.com/Priyanka6304/terraform-mini-project
```

---

## Development Environment

This project can be executed using:

* Visual Studio Code
* MobaXterm
* Git Bash
* Linux Terminal
* AWS CloudShell

For this implementation, Visual Studio Code on Windows was used.

---

## Learning Outcomes

* Terraform Fundamentals
* Infrastructure as Code (IaC)
* AWS Networking
* EC2 Provisioning
* Remote State Management using S3
* Variables and Outputs
* GitHub Version Control
* Troubleshooting Real-Time Deployment Issues

---

## Author

Priyanka

Terraform Mini Project

AWS | Terraform | Infrastructure as Code
