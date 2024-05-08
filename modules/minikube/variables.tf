variable "cluster_name" {
  type        = string
  default     = "test-cluster"
  description = "Minikube cluster name"
}

variable "driver" {
  type        = string
  default     = "docker"
  description = "Minikube driver"
}

variable "kubeconfig" {
  type        = string
  default     = "~/.kube/config"
  description = "The path to the kubeconfig file for minikube"
}