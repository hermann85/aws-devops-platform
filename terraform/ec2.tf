data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }
}

locals {
  grafana_domain = var.environment == "staging" ? "staging-grafana.hdb-devops.fr" : "grafana.hdb-devops.fr"
  prometheus_domain = var.environment == "staging" ? "staging-prometheus.hdb-devops.fr" : "prometheus.hdb-devops.fr"
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name
  user_data_replace_on_change = true

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
    encrypted   = true
  }

  user_data = <<-EOF
    #!/bin/bash
    set -euxo pipefail

    dnf update -y
    dnf install -y docker git amazon-ssm-agent nginx

    systemctl enable docker
    systemctl start docker

    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent

    systemctl enable nginx
    systemctl start nginx

    usermod -aG docker ec2-user

    mkdir -p /opt/monitoring

    cat > /opt/monitoring/prometheus.yml <<'EOC'
    global:
      scrape_interval: 15s

    scrape_configs:
      - job_name: "prometheus"
        static_configs:
          - targets: ["localhost:9090"]

      - job_name: "node-exporter"
        static_configs:
          - targets: ["172.17.0.1:9100"]
    EOC

    # Nettoyage au cas où l'image ou le script soit rejoué
    docker rm -f grafana prometheus node-exporter || true

    docker run -d \
      -p 3000:3000 \
      --name grafana \
      --restart unless-stopped \
      grafana/grafana

    docker run -d \
      -p 9100:9100 \
      --name node-exporter \
      --restart unless-stopped \
      prom/node-exporter

    docker run -d \
      -p 9090:9090 \
      --name prometheus \
      --restart unless-stopped \
      -v /opt/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml \
      prom/prometheus

    cat > /etc/nginx/conf.d/grafana.conf <<EON
    server {
        listen 80;
        server_name ${local.grafana_domain};

        location / {
            proxy_pass http://127.0.0.1:3000;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }
    EON

    cat > /etc/nginx/conf.d/prometheus.conf <<EON
    server {
        listen 80;
        server_name ${local.prometheus_domain};

        location / {
            proxy_pass http://127.0.0.1:9090;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }
    EON

    rm -f /etc/nginx/conf.d/default.conf

    nginx -t
    systemctl restart nginx
  EOF

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-${var.ec2_name}"
      Role = "web-monitoring"
    }
  )
}

resource "aws_eip" "app" {
  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-${var.ec2_name}-eip"
    }
  )
}

resource "aws_eip_association" "app" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.app.id
}