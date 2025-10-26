# AWS VPC Infrastructure with Terraform

This project provisions a complete AWS VPC infrastructure with public and private subnets using Terraform.

## Overview

This Terraform configuration creates a secure, production-ready VPC environment with the following components:

- Virtual Private Cloud (VPC) with CIDR block 10.0.0.0/16
- Public subnet (10.0.1.0/24) for internet-facing resources
- Private subnet (10.0.2.0/24) for internal resources
- Internet Gateway for public internet access
- NAT Gateway for private subnet internet connectivity
- Security groups with appropriate firewall rules
- EC2 instances in both public and private subnets

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with valid credentials
- AWS account with appropriate permissions
- SSH key pair named "my-ssh" in the target AWS region

## Configuration

Create a `terraform.tfvars` file with your AWS credentials:

```hcl
aws_region     = "ap-south-1"
aws_access_key = "your-access-key"
aws_secret_key = "your-secret-key"
```

## Usage

Initialize Terraform:

```bash
terraform init
```

Review the execution plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Destroy the infrastructure:

```bash
terraform destroy
```

## Outputs

After successful deployment, Terraform outputs:

- Public instance public IP address
- Private instance private IP address

## File Structure

```
.
├── main.tf                 # Provider configuration
├── vpc.tf                  # VPC and subnets
├── security_groups.tf      # Security groups and rules
├── gateways.tf             # Internet and NAT gateways
├── routes.tf               # Route tables and associations
├── instances.tf            # EC2 instances
├── outputs.tf              # Output definitions
├── variables.tf            # Variable declarations
└── terraform.tfvars       # Variable values (not tracked in Git)
```

## Security Considerations

- Security groups restrict SSH access to private instances from public subnet only
- Public instance allows SSH, HTTP, and HTTPS inbound from internet
- Private subnet instances have no direct internet connectivity
- Sensitive files are excluded via .gitignore

## Cost Optimization

NAT Gateways incur hourly charges. Consider replacing with NAT instances for development environments or removing NAT Gateway if private instances don't require internet access.
