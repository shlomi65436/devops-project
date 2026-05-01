variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "devops-project"
}

variable "db_username" {
  default = "postgres"
}

variable "db_password" {
  description = "RDS password"
  sensitive   = true
}