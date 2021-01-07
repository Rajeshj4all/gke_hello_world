resource "kubernetes_service" "app" {
  metadata {
    name = var.svc
  }
  spec {
    selector = {
      app = kubernetes_deployment.app.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 80
      target_port = 5000
    }

    type = "LoadBalancer"
  }
} 