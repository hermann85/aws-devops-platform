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

output "grafana_url" {
  description = "URL Grafana"
  value       = "http://${aws_eip.app.public_ip}:${var.grafana_port}"
}

output "prometheus_url" {
  description = "URL Prometheus"
  value       = "http://${aws_eip.app.public_ip}:${var.prometheus_port}"
}

output "node_exporter_url" {
  description = "URL Node Exporter"
  value       = "http://${aws_eip.app.public_ip}:${var.node_exporter_port}"
}

output "ssm_connection_hint" {
  description = "Commande indicative pour une session SSM"
  value       = "aws ssm start-session --target ${aws_instance.web.id}"
}
