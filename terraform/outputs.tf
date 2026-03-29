output "vpc_id" {
  description = "ID du VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID du subnet public"
  value       = aws_subnet.public.id
}

output "instance_id" {
  description = "ID de l'instance EC2"
  value       = aws_instance.web.id
}

output "instance_public_ip" {
  description = "Adresse IP publique de l'instance"
  value       = aws_eip.app.public_ip
}

output "instance_dns" {
  description = "DNS public de l'instance EC2"
  value       = aws_instance.web.public_dns
}

output "grafana_url_ip" {
  description = "URL Grafana via IP"
  value       = "http://${aws_eip.app.public_ip}:${var.grafana_port}"
}

output "prometheus_url_ip" {
  description = "URL Prometheus via IP"
  value       = "http://${aws_eip.app.public_ip}:${var.prometheus_port}"
}

output "node_exporter_url_ip" {
  description = "URL Node Exporter via IP"
  value       = "http://${aws_eip.app.public_ip}:${var.node_exporter_port}"
}

output "grafana_url_domain" {
  description = "URL Grafana via domaine"
  value       = "http://${local.grafana_domain}"
}

output "prometheus_url_domain" {
  description = "URL Prometheus via domaine"
  value       = "http://${local.prometheus_domain}"
}

output "ssm_connection_hint" {
  description = "Commande pour se connecter via SSM"
  value       = "aws ssm start-session --target ${aws_instance.web.id}"
}