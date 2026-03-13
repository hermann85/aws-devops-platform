# AWS DevOps Terraform Docker CI/CD Monitoring

Projet DevOps démontrant le déploiement automatisé d'une application Docker sur AWS avec Terraform et GitHub Actions.

## Objectif du projet

Ce projet a pour but de montrer la mise en place d'une chaîne DevOps complète :

- provisionnement d'une infrastructure AWS avec Terraform
- déploiement d'une application conteneurisée avec Docker
- automatisation du déploiement avec GitHub Actions
- supervision de l'infrastructure et de l'application avec Prometheus et Grafana

## Technologies

- **AWS**
- **Terraform**
- **Docker**
- **GitHub Actions**
- **Prometheus**
- **Grafana**

## Architecture

Terraform → AWS EC2 → Docker → CI/CD → Monitoring

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

## Étape 3 : Se connecter au serveur

- ssh -i .\aws-devops-platform.pem ec2-user@IP_INSTANCE 

- Remplacez IP_INSTANCE par l'adresse IP publique de votre instance EC2.

## Étape 4 : Lancer l'application

- cd app :
- docker build -t web .
- docker run -d -p 80:80 web

## Étape 5 : Monitoring

- cd monitoring :
- docker-compose up -d
- Grafana : http://IP_INSTANCE:3000
- Prometheus : http://IP_INSTANCE:9090

## Étape 6 : CI/CD

Créer les secrets GitHub :

- HOST
- SSH_KEY

Chaque push sur main déclenche le déploiement automatique.

## Conseil

### Résultat attendu : 

- À la fin du projet, vous disposerez de :

- une infrastructure AWS déployée avec Terraform
- une application Docker en cours d'exécution sur EC2
- un pipeline CI/CD opérationnel avec GitHub Actions
- une supervision active avec Prometheus et Grafana

## Conseil important pour impressionner les recruteurs (à supprimer apès)

Ajoutez dans votre README :

- 📷 screenshot Grafana dashboard
- 📷 screenshot GitHub Actions pipeline
- 📷 screenshot application web

Cela rend le projet beaucoup plus crédible.
