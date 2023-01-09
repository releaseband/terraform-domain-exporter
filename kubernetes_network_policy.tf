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
