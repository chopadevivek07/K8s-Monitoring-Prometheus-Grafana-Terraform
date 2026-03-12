resource "helm_release" "grafana" {

  name       = "grafana"

  repository = "https://grafana.github.io/helm-charts"

  chart      = "grafana"

  namespace  = kubernetes_namespace.monitoring.metadata[0].name

  depends_on = [
    helm_release.prometheus
  ]

}