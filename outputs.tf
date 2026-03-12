output "namespace" {

  value = kubernetes_namespace.monitoring.metadata[0].name

}

output "grafana_release" {

  value = helm_release.grafana.name

}

output "prometheus_release" {

  value = helm_release.prometheus.name

}