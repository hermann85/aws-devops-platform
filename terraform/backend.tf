terraform {
  backend "s3" {
    bucket         = "hdb-devops-terraform-state-2026"
    key            = "dev/aws-devops-platform/terraform.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}