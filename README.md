## 🚀 AWS DevOps Platform – Terraform, Docker, CI/CD & Monitoring

Plateforme DevOps complète démontrant le déploiement automatisé d’une application sur AWS avec Infrastructure as Code, conteneurisation, CI/CD et monitoring sécurisé.

---

## 🎯 Objectif du projet

Mettre en place une chaîne DevOps complète incluant :

- Provisionnement d’infrastructure avec Terraform
- Conteneurisation avec Docker
- Pipeline CI/CD avec GitHub Actions
- Déploiement automatisé via Amazon ECR et EC2
- Monitoring avec Prometheus & Grafana
- Exposition sécurisée via Nginx + HTTPS (Let's Encrypt)

---

## 🛠️ Stack technique

- AWS : EC2, IAM, ECR, S3, DynamoDB
- Terraform : Infrastructure as Code
- Docker & Docker Compose : Containerisation
- GitHub Actions : CI/CD
- Nginx : Reverse proxy
- Prometheus : Collecte des métriques
- Grafana : Visualisation & dashboards
- Certbot / Let's Encrypt : HTTPS

---

## 🌐 Accès aux services

- 🔗 Application : https://hdb-devops.fr  
- 📊 Grafana : https://grafana.hdb-devops.fr  
- 📈 Prometheus : https://prometheus.hdb-devops.fr

---

## 🏗️ Architecture

Diagramme

![Grafana Dashboard](docs/images/Architecture_DevOps_complete.png)

## Stack

## Cloud
- AWS EC2 (Compute)
- AWS ECR (Container registry)
- AWS S3 (Terraform state)
- AWS DynamoDB (State locking)
- IAM (Security)

## DevOps
- Terraform (Infrastructure as Code)
- Docker & Docker Compose
- GitHub Actions (CI/CD)

## Monitoring
- Prometheus
- Node Exporter
- Grafana

## Networking & Security
- Nginx Reverse Proxy
- HTTPS (Let's Encrypt)
- Security Groups

## 1. Cloner le projet

- git clone https://github.com/hermann85/aws-devops-platform.git
- cd aws-devops-terraform-docker-cicd-monitoring

## 2. Déployer l’infrastructure
- cd terraform
- terraform init
- terraform plan
- terraform apply

## 3. Connexion à EC2

- ssh -i .\aws-devops-platform.pem ec2-user@IP_INSTANCE 
- Remplacez IP_INSTANCE par l'adresse IP publique de votre instance EC2.

## 4. Déploiement applicatif

👉 Automatique via GitHub Actions

Chaque push sur main déclenche :

- build Docker
- push vers ECR
- déploiement sur EC2

## CI/CD

Pipeline GitHub Actions :

- Build image Docker
- Tests container
- Push vers Amazon ECR
- Déploiement automatique via SSH

Créer les secrets GitHub :

- EC2_HOST
- EC2_SSH_KEY
- EC2_USER
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_ACCOUNT_ID

## Monitoring

- Prometheus collecte les métriques
- Node Exporter supervise l’EC2
- Grafana visualise les données
- Dashboard Node Exporter intégré

![Grafana Dashboard](docs/images/grafana-dashboard.png)

## Sécurité

- IAM roles pour EC2
- Security Groups restreints
- Secrets via GitHub Actions
- Reverse proxy Nginx
- HTTPS avec Let's Encrypt

## Stratégie de branches

- development : développement
- staging : validation
- main : production

Workflow : development → staging → main

## Compétences démontrées : 

- Infrastructure as Code (Terraform)
- CI/CD (GitHub Actions)
- Docker & containerisation
- Déploiement AWS (EC2, ECR)
- Reverse proxy & HTTPS
- Monitoring (Prometheus + Grafana)
- Debug & troubleshooting cloud

## Améliorations possibles

- Alerting Grafana (email / Slack)
- Multi-environnements (dev/staging/prod)
- Load Balancer AWS (ALB)
- Auto Scaling
- Migration Kubernetes (EKS)

## Résultat :

À la fin du projet :

- Infrastructure AWS automatisée
- Déploiement continu fonctionnel
- Monitoring complet
- Plateforme sécurisée HTTPS
- Architecture DevOps production-ready

Auteur : Hermann Bienvenu DZOUAVELE IKYA 
- Ingénieur Devops Cloud (AWS)