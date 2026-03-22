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
  description = "Adresse IP publique fixe (Elastic IP)"
  value       = aws_eip.web_eip.public_ip
}

output "instance_dns" {
  description = "DNS public de l'instance EC2"
  value       = aws_instance.web.public_dns
}

output "grafana_url" {
  description = "URL Grafana"
  value       = "http://${aws_eip.web_eip.public_ip}:${var.grafana_port}"
}

output "prometheus_url" {
  description = "URL Prometheus"
  value       = "http://${aws_eip.web_eip.public_ip}:${var.prometheus_port}"
}

output "node_exporter_url" {
  description = "URL Node Exporter"
  value       = "http://${aws_eip.web_eip.public_ip}:${var.node_exporter_port}"
}

output "ssh_connection" {
  description = "Commande SSH de connexion"
  value       = "ssh -i <path-to-private-key> ec2-user@${aws_eip.web_eip.public_ip}"
}