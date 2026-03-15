output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "instance_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.web.public_dns
}

output "grafana_url" {
  description = "Grafana access URL"
  value       = "http://${aws_instance.web.public_ip}:3000"
}

output "prometheus_url" {
  description = "Prometheus access URL"
  value       = "http://${aws_instance.web.public_ip}:9090"
}

output "ssh_connection" {
  description = "SSH command to connect to the instance"
  value       = "ssh ec2-user@${aws_instance.web.public_ip}"
}

# output "instance_ip" {
#   description = "Public IP of EC2"
#   value       = aws_instance.web.public_ip
# }

# output "ssh_connection" {
#   value = "ssh ec2-user@${aws_instance.web.public_ip}"
# }