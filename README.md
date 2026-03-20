# 🚀 AWS DevOps Platform with Terraform, Docker, CI/CD and Monitoring

Projet DevOps démontrant le déploiement automatisé d'une application Docker sur AWS avec Terraform, GitHub Actions et Amazon ECR.

---

## 🎯 Objectif du projet

Ce projet a pour but de mettre en place une chaîne DevOps complète :

- Provisionnement d'une infrastructure AWS avec Terraform
- Conteneurisation d'une application avec Docker
- Mise en place d’un pipeline CI/CD avec GitHub Actions
- Déploiement automatisé via Amazon ECR et EC2
- Supervision avec Prometheus et Grafana

---

## 🛠️ Technologies utilisées

- **AWS (EC2, IAM, ECR)**
- **Terraform (Infrastructure as Code)**
- **Docker**
- **GitHub Actions (CI/CD)**
- **Prometheus**
- **Grafana**

---

## 🏗️ Architecture

GitHub → GitHub Actions → Amazon ECR → EC2 → Docker → Prometheus → Grafana

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- Terraform
- Docker
- Git
- un compte AWS
- une paire de clés SSH pour se connecter à l'instance EC2

## Étape 1 : Cloner le projet

- git clone https://github.com/votrecompte/aws-devops-terraform-docker-cicd-monitoring
- cd aws-devops-terraform-docker-cicd-monitoring

## Étape 2 : Déployer l'infrastructure AWS

- cd terraform
- terraform init
- terraform plan
- terraform apply

## Étape 3 : Se connecter à l'instance EC2

- ssh -i .\aws-devops-platform.pem ec2-user@IP_INSTANCE 

- Remplacez IP_INSTANCE par l'adresse IP publique de votre instance EC2.

## Étape 4 : Lancer l'application

- cd app :
- docker build -t web .
- docker run -d -p 80:80 web

## Étape 5 : Monitoring

- Mise en place de Prometheus pour collecter les métriques
- Utilisation de node-exporter pour superviser l’instance EC2
- Configuration de Grafana pour la visualisation des métriques
- Création de dashboards personnalisés (CPU, mémoire, réseau)

![Grafana Dashboard](docs/images/grafana-dashboard.png)

## Étape 6 : CI/CD

Créer les secrets GitHub :

- HOST
- SSH_KEY

Chaque push sur main déclenche le déploiement automatique.

### Compétences démontrées : 

- Infrastructure as Code (Terraform)
- CI/CD avec GitHub Actions
- Containerisation avec Docker
- Déploiement AWS (EC2 + ECR)
- Monitoring (Prometheus / Grafana)
- Gestion des permissions IAM
- Debug et troubleshooting cloud

# Sécurité

- Utilisation de rôles IAM pour EC2
- Accès restreint via Security Groups
- Gestion des secrets avec GitHub Actions

# Améliorations possibles

- Backend Terraform distant (S3 + DynamoDB)
- Migration vers ECS / Kubernetes (EKS)
- Mise en place HTTPS (Nginx + Let's Encrypt)
- Alerting Grafana
- Déploiement multi-environnements (dev/staging/prod)

### Résultat :

À la fin du projet :

- Infrastructure AWS automatisée avec Terraform
- Application Docker déployée automatiquement via CI/CD
- Pipeline GitHub Actions fonctionnel avec ECR
- Monitoring en temps réel avec Prometheus et Grafana

Auteur : Hermann Bienvenu DZOUAVELE IKYA / Ingénieur Devops 