output "vpc_id" {
  description = "ID du VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID du subnet public"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID du subnet privé"
  value       = aws_subnet.private.id
}

output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.web.id
}

output "instance_ip" {
  description = "Adresse IP publique de l'instance EC2"
  value       = aws_instance.web.public_ip
}

output "instance_dns" {
  description = "DNS public de l'instance EC2"
  value       = aws_instance.web.public_dns
}

output "grafana_url" {
  description = "URL Grafana si le service écoute bien sur le port 3000"
  value       = "http://${aws_instance.web.public_ip}:${var.grafana_port}"
}

output "prometheus_url" {
  description = "URL Prometheus si le service écoute bien sur le port 9090"
  value       = "http://${aws_instance.web.public_ip}:${var.prometheus_port}"
}

output "ssh_connection" {
  description = "Commande SSH de connexion"
  value       = "ssh -i <path-to-private-key> ec2-user@${aws_instance.web.public_ip}"
}