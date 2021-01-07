terraform {
  required_version = "~>0.12"
  backend "remote" {
    organization = "Workspace-Rajesh"
    workspaces {
      name = "gke-kube-app"
    }
  }
}
