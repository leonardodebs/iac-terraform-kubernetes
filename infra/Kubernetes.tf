

resource "kubernetes_deployment" "django_api" {
  metadata {
    name      = "django-api"
    namespace = "default"
    labels = {
      nome = "django"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        nome = "django"
      }
    }

    template {
      metadata {
        labels = {
          nome = "django"
        }
      }

      spec {
        container {
          name  = "django"
          image = "986339316015.dkr.ecr.us-west-2.amazonaws.com/producao:v1"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/clientes"
              port = 8000
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "load_balancer" {
  metadata {
    name = "load-balancer-django-api"
  }

  spec {
    selector = {
      nome = "django"
    }

    port {
      port        = 8000
      target_port = 8000
    }

    type = "LoadBalancer"
  }
}

data "kubernetes_service" "nome_dns" {
  metadata {
    name      = kubernetes_service.load_balancer.metadata[0].name
    namespace = "default"
  }

  depends_on = [kubernetes_service.load_balancer]
}

output "django_api_hostname" {
  value       = data.kubernetes_service.nome_dns.status[0].load_balancer[0].ingress[0].hostname
  description = "Hostname público do LoadBalancer"
}

output "django_api_ip" {
  value       = data.kubernetes_service.nome_dns.status[0].load_balancer[0].ingress[0].ip
  description = "Endereço IP público do LoadBalancer"
}