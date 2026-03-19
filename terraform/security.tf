resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = "Security group for EC2 web/monitoring instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidrs
  }

  ingress {
    description = "HTTP"
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = var.http_allowed_cidrs
  }

  ingress {
    description = "Grafana"
    from_port   = var.grafana_port
    to_port     = var.grafana_port
    protocol    = "tcp"
    cidr_blocks = var.grafana_allowed_cidrs
  }

  ingress {
    description = "Prometheus"
    from_port   = var.prometheus_port
    to_port     = var.prometheus_port
    protocol    = "tcp"
    cidr_blocks = var.prometheus_allowed_cidrs
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_allowed_cidrs
  }

  tags = {
    Name = var.security_group_name
  }
}