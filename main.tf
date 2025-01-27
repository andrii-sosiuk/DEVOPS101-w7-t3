
# USe local cluster for tests
# module "minikube_cluster" {
#   source       = "./modules/minikube"
#   cluster_name = "devops101-flux"
#   driver       = "docker"
# }

# Production cluster
module "gke_cluster" {
  # source         = "github.com/andrii-sosiuk/DEVOPS101-W7-T1"
  source         = "github.com/den-vasyliev/tf-google-gke-cluster?ref=gke_auth"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}

module "tls_private_key" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
}

module "github_repository" {
  source                   = "github.com/den-vasyliev/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux"
}

# locals {
#   kubeconfig_path = abspath(module.gke_cluster.kubeconfig)
# }

module "flux_bootstrap" {
  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap?ref=gke_auth"
  config_host  = module.gke_cluster.config_host
  config_token = module.gke_cluster.config_token
  config_ca = module.gke_cluster.config_ca
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  private_key       = module.tls_private_key.private_key_pem
  # config_path       = module.gke_cluster.kubeconfig 
  # config_path       = module.minikube_cluster.kubeconfig
  github_token = var.GITHUB_TOKEN
}

