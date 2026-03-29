variable "environment" {
  description = "Environnement (staging ou prod)"
  type        = string
}

variable "ec2_name" {
  description = "Nom de l'instance EC2"
  type        = string
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nom de la clé SSH"
  type        = string
}

variable "ami_owner" {
  description = "Owner AMI Amazon Linux"
  type        = string
  default     = "amazon"
}

variable "ami_name_filter" {
  description = "Filtre AMI"
  type        = string
  default     = "al2023-ami-*-x86_64"
}

variable "root_volume_size" {
  description = "Taille disque root"
  type        = number
  default     = 10
}

variable "root_volume_type" {
  description = "Type disque root"
  type        = string
  default     = "gp3"
}

# 🔐 Sécurité
variable "ssh_allowed_cidrs" {
  description = "IP autorisées SSH"
  type        = list(string)
}

variable "http_allowed_cidrs" {
  description = "IP autorisées HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_allowed_cidrs" {
  description = "IP autorisées HTTPS"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "grafana_allowed_cidrs" {
  description = "IP autorisées Grafana"
  type        = list(string)
}

variable "prometheus_allowed_cidrs" {
  description = "IP autorisées Prometheus"
  type        = list(string)
}

variable "node_exporter_allowed_cidrs" {
  description = "IP autorisées Node Exporter"
  type        = list(string)
}

# 🏷️ Tags
variable "common_tags" {
  description = "Tags communs"
  type        = map(string)
  default = {
    Project = "aws-devops-platform"
    Owner   = "HDB"
  }
}

variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "eu-west-3"
}

variable "security_group_name" {
  description = "Nom du security group"
  type        = string
}

variable "domain_name" {
  description = "Nom de domaine principal"
  type        = string
}

variable "ssh_port" {
  description = "Port SSH"
  type        = number
  default     = 22
}

variable "http_port" {
  description = "Port HTTP"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Port HTTPS"
  type        = number
  default     = 443
}

variable "grafana_port" {
  description = "Port Grafana"
  type        = number
  default     = 3000
}

variable "prometheus_port" {
  description = "Port Prometheus"
  type        = number
  default     = 9090
}

variable "node_exporter_port" {
  description = "Port Node Exporter"
  type        = number
  default     = 9100
}

variable "egress_allowed_cidrs" {
  description = "CIDR autorisés en sortie"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpc_cidr" {
  description = "CIDR du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Activer DNS support sur le VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Activer DNS hostnames sur le VPC"
  type        = bool
  default     = true
}

variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
  default     = "aws-devops-vpc"
}

variable "public_subnet_cidr" {
  description = "CIDR du subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
  default     = "eu-west-3a"
}

variable "public_subnet_map_public_ip" {
  description = "Assigner automatiquement une IP publique"
  type        = bool
  default     = false
}

variable "public_subnet_name" {
  description = "Nom du subnet public"
  type        = string
  default     = "aws-devops-public-subnet"
}

variable "internet_gateway_name" {
  description = "Nom de l'internet gateway"
  type        = string
  default     = "aws-devops-igw"
}

variable "default_route_cidr" {
  description = "Route par défaut"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_route_table_name" {
  description = "Nom de la table de routage publique"
  type        = string
  default     = "aws-devops-public-rt"
}