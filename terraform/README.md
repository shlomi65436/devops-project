# Terraform Infrastructure

This directory contains the full AWS infrastructure as code.

## What it provisions:
- VPC with public & private subnets
- EKS cluster (Kubernetes)
- RDS PostgreSQL database
- ECR repositories for Docker images
- CloudWatch logs & alarms

## Usage:
terraform init
terraform plan -var="db_password=YOUR_PASSWORD"
terraform apply -var="db_password=YOUR_PASSWORD"

## To destroy all resources:
terraform destroy -var="db_password=YOUR_PASSWORD"