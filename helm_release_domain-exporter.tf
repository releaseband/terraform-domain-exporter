resource "helm_release" "domain-exporter" {
  name        = "domain-exporter"
  namespace   = "monitoring"
  repository  = "https://zifter.github.io/helm-charts/"
  timeout     = 240
  version     = "0.3.4"
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
    cpu: 5m
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