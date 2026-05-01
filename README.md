# DevOps Project — Task Manager App

A full-stack Task Manager application built to demonstrate DevOps best practices.

## Architecture

GitHub Push → GitHub Actions CI/CD Pipeline
↓
Build & Test
↓
Push to DockerHub
↓
Kubernetes (EKS on AWS / Minikube locally)
├── Frontend (React + Nginx)
├── Backend (Node.js + Express)
└── Database (PostgreSQL)

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React, TypeScript, Nginx |
| Backend | Node.js, Express |
| Database | PostgreSQL (RDS on AWS) |
| Containers | Docker |
| Orchestration | Kubernetes (EKS / Minikube) |
| Infrastructure | Terraform |
| CI/CD | GitHub Actions |
| Monitoring | AWS CloudWatch |
| Image Registry | DockerHub / AWS ECR |

## Project Structure

devops-project/
├── frontend/          # React app
├── backend/           # Node.js API
├── terraform/         # AWS infrastructure as code
├── k8s/               # Kubernetes manifests
└── .github/
└── workflows/     # GitHub Actions pipeline

## Running Locally

### With Docker Compose:
```bash
docker-compose up --build
```
App available at http://localhost

### With Kubernetes (Minikube):
```bash
minikube start
eval $(minikube docker-env)
docker build -t devops-project-backend:latest ./backend
docker build -t devops-project-frontend:latest ./frontend
kubectl apply -f k8s/
minikube service frontend-service
```

## CI/CD Pipeline

Every push to `main` branch:
1. Runs backend tests
2. Builds Docker images
3. Pushes to DockerHub
4. (Production) Deploys to EKS

## Infrastructure (Terraform)

The `terraform/` directory contains full AWS infrastructure:
- VPC with public & private subnets
- EKS cluster (Kubernetes)
- RDS PostgreSQL database
- ECR repositories
- CloudWatch logs & alarms

To provision:
```bash
cd terraform
terraform init
terraform apply -var="db_password=YOUR_PASSWORD"
```

To destroy:
```bash
terraform destroy -var="db_password=YOUR_PASSWORD"
```