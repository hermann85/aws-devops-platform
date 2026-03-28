locals {
  ingress_rules = {
    ssh = {
      description = "SSH"
      from_port   = var.ssh_port
      to_port     = var.ssh_port
      cidrs       = var.ssh_allowed_cidrs
    }
    http = {
      description = "HTTP"
      from_port   = var.http_port
      to_port     = var.http_port
      cidrs       = var.http_allowed_cidrs
    }
    https = {
      description = "HTTPS"
      from_port   = var.https_port
      to_port     = var.https_port
      cidrs       = var.https_allowed_cidrs
    }
    grafana = {
      description = "Grafana"
      from_port   = var.grafana_port
      to_port     = var.grafana_port
      cidrs       = var.grafana_allowed_cidrs
    }
    prometheus = {
      description = "Prometheus"
      from_port   = var.prometheus_port
      to_port     = var.prometheus_port
      cidrs       = var.prometheus_allowed_cidrs
    }
    node_exporter = {
      description = "Node Exporter"
      from_port   = var.node_exporter_port
      to_port     = var.node_exporter_port
      cidrs       = var.node_exporter_allowed_cidrs
    }
  }

  flattened_ingress_rules = flatten([
    for rule_name, rule in local.ingress_rules : [
      for cidr in rule.cidrs : {
        key         = "${rule_name}-${replace(cidr, "/", "_")}"
        description = rule.description
        from_port   = rule.from_port
        to_port     = rule.to_port
        cidr        = cidr
      }
    ]
  ])
}

resource "aws_security_group" "web_sg" {
  name        = "${var.environment}-${var.security_group_name}"
  description = "Security group for DevOps platform"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.egress_allowed_cidrs
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.environment}-${var.security_group_name}"
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "this" {
  for_each = {
    for rule in local.flattened_ingress_rules : rule.key => rule
  }

  security_group_id = aws_security_group.web_sg.id
  description       = each.value.description
  ip_protocol       = "tcp"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  cidr_ipv4         = each.value.cidr
}