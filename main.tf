resource "helm_release" "domain-exporter" {
  name        = "domain-exporter"
  namespace   = "monitoring"
  repository  = "https://zifter.github.io/helm-charts/"
  timeout     = 240
  version     = var.chart_version
  chart       = "domain-exporter"
  max_history = 10
  values = [
    <<-EOF
image:
  repository: ${var.image_repository}
  pullPolicy: Always
  tag: ${var.image_tag}
podSecurityContext:
  fsGroup: 2000
securityContext:
  capabilities:
    drop:
    - ALL
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  runAsUser: 1000
  allowPrivilegeEscalation: false
resources:
  limits:
    cpu: 100m
    memory: 128Mi
  requests:
    cpu: 1m
    memory: 128Mi
rules:
  enabled: false
dashboards:
  enabled: true
metrics:
  enabled: true
  interval: 1m
    EOF
  ]
  set {
    name  = "domains"
    value = "{${var.domain_list}}"
  }
}

resource "kubernetes_network_policy" "domain-exporter" {
  metadata {
    name      = "domain-exporter"
    namespace = "monitoring"
  }

  spec {
    pod_selector {
      match_labels = {
        "app.kubernetes.io/instance" = "domain-exporter"
      }
    }

    ingress {
      ports {
        port     = "9203"
        protocol = "TCP"
      }
      from {
        namespace_selector {
          match_labels = {
            name = "monitoring"
          }
        }
        pod_selector {
          match_labels = {
            "app.kubernetes.io/instance" = "monitoring-kube-prometheus-prometheus"
          }
        }
      }
    }
    egress {
      ports {
        port     = "587"
        protocol = "TCP"
      }
      ports {
        port     = "43"
        protocol = "TCP"
      }
    }
    policy_types = ["Ingress", "Egress"]
  }
}
