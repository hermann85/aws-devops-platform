data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_name_filter]
  }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.ec2_ssm_profile.name

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
    set -eux

    dnf update -y
    dnf install -y docker git amazon-ssm-agent

    systemctl enable docker
    systemctl start docker

    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent

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

    sleep 10

    docker run -d \
      -p 3000:3000 \
      --name grafana \
      --restart unless-stopped \
      -v grafana-data:/var/lib/grafana \
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
      -v prometheus-data:/prometheus \
      -v /opt/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml \
      prom/prometheus
  EOF

  tags = merge(
    var.common_tags,
    {
      Name = var.ec2_name
      Role = "web-monitoring"
    }
  )
}


resource "aws_eip" "app" {
  domain = "vpc"

  tags = merge(
    var.common_tags,
    {
      Name = "${var.ec2_name}-eip"
      Role = "public-static-ip"
    }
  )
}

resource "aws_eip_association" "app" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.app.id
}
