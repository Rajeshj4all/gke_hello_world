variable "cluster" {
  default = "eclipx-dev"
}

variable "app" {
  type        = string
  description = "Name of application"
  default     = "eclipx-hello-world-app"
}

variable "svc" {
  type        = string
  description = "Name of application"
  default     = "eclipx-hello-world-app-svc"
}
variable "zone" {
  default = "us-east1-d"
}

variable "docker-image" {
  type        = string
  description = "Hello-world-app deployment"
  default     = "jayarar3/hello-world-app:latest"
}

