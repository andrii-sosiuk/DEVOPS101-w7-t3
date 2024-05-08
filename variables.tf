variable "GITHUB_OWNER" {
  type        = string
  default     = "owner"
  description = "Hithub owner"
}

variable "FLUX_GITHUB_REPO" {
  type        = string
  default     = "devops-101-flux"
  description = "Hithub flux bootstrap repo"
}

variable "GITHUB_TOKEN" {
  type        = string
  sensitive   = true
  description = "Hithub token"
}

variable "GOOGLE_PROJECT" {
  type        = string
  default     = "dron-demo"
  description = "GCP project name"
}

variable "GOOGLE_REGION" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region to use"
}

variable "GKE_MACHINE_TYPE" {
  type        = string
  default     = "g1-small"
  description = "Machine type"
}


