output "URL" {
  value       = data.kubernetes_service.nome_dns.status[0].load_balancer[0].ingress[0].hostname
  description = "Endereço público do LoadBalancer da API Django"
}
