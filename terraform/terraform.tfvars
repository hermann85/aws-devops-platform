aws_region = "eu-west-3"

key_name = "aws-devops-platform"

ssh_allowed_cidrs = ["82.64.120.245/32"]
http_allowed_cidrs = ["0.0.0.0/0"]

grafana_allowed_cidrs = ["82.64.120.245/32"]
prometheus_allowed_cidrs = ["82.64.120.245/32"]

common_tags = {
  Environment = "dev"
  Project     = "aws-devops-platform"
  ManagedBy   = "Terraform"
  Owner       = "HDB-SERVICES"
}