variable "project" {
  default = "eclipx-demo-project"
}

variable "region" {
  default = "us-east1"
}

variable "zone" {
  default = "us-east1-d"
}

variable "cluster" {
  default = "eclipx-dev"
}

variable "credentials" {
  default = "/Users/rajeshkumarjayaraj/GCP/eclipx-demo-project.json"
}

variable "kubernetes_min_ver" {
  default = "latest"
}

variable "kubernetes_max_ver" {
  default = "latest"
}

variable "machine_type" {
  default = "g1-small"
}

variable "app_name" {
  default = "eclipx-demo-app"
}
