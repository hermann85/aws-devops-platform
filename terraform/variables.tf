variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR block du VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Active le support DNS dans le VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Active les hostnames DNS dans le VPC"
  type        = bool
  default     = true
}

variable "public_subnet_cidr" {
  description = "CIDR block du subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block du subnet privé"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_subnet_map_public_ip" {
  description = "Assigne automatiquement une IP publique dans le subnet public"
  type        = bool
  default     = true
}

variable "default_route_cidr" {
  description = "Route par défaut"
  type        = string
  default     = "0.0.0.0/0"
}

variable "availability_zone" {
  description = "Availability Zone à utiliser. Null = AWS choisit automatiquement."
  type        = string
  default     = null
}

variable "vpc_name" {
  description = "Nom du VPC"
  type        = string
  default     = "vpc-main"
}

variable "public_subnet_name" {
  description = "Nom du subnet public"
  type        = string
  default     = "subnet-public"
}

variable "private_subnet_name" {
  description = "Nom du subnet privé"
  type        = string
  default     = "subnet-private"
}

variable "internet_gateway_name" {
  description = "Nom de l'Internet Gateway"
  type        = string
  default     = "igw-main"
}

variable "eip_name" {
  description = "Nom de l'Elastic IP"
  type        = string
  default     = "eip-ngw"
}

variable "nat_gateway_name" {
  description = "Nom du NAT Gateway"
  type        = string
  default     = "nat-gateway"
}

variable "public_route_table_name" {
  description = "Nom de la route table publique"
  type        = string
  default     = "public-rt"
}

variable "private_route_table_name" {
  description = "Nom de la route table privée"
  type        = string
  default     = "private-rt"
}

variable "security_group_name" {
  description = "Nom du security group"
  type        = string
  default     = "devops-web-sg"
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

variable "ssh_allowed_cidrs" {
  description = "CIDR autorisés pour SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_allowed_cidrs" {
  description = "CIDR autorisés pour HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "grafana_allowed_cidrs" {
  description = "CIDR autorisés pour Grafana"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "prometheus_allowed_cidrs" {
  description = "CIDR autorisés pour Prometheus"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_exporter_allowed_cidrs" {
  description = "CIDR autorisés pour Node Exporter"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_allowed_cidrs" {
  description = "CIDR autorisés en sortie"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ami_owner" {
  description = "Owner ID de l'AMI Amazon Linux"
  type        = string
  default     = "137112412989"
}

variable "ami_name_filter" {
  description = "Filtre de nom pour l'AMI"
  type        = string
  default     = "al2023-ami-*-x86_64"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nom de la key pair AWS existante"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Associer une IP publique à l'instance"
  type        = bool
  default     = true
}

variable "root_volume_size" {
  description = "Taille du volume root"
  type        = number
  default     = 20
}

variable "root_volume_type" {
  description = "Type du volume root"
  type        = string
  default     = "gp3"
}

variable "ec2_name" {
  description = "Nom de l'instance EC2"
  type        = string
  default     = "devops-ec2"
}

variable "common_tags" {
  description = "Tags communs"
  type        = map(string)
  default = {
    Environment = "dev"
    Project     = "aws-devops-platform"
    ManagedBy   = "Terraform"
  }
}