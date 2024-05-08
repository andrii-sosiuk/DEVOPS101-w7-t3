# ${path.module} is an interpolated string in Terraform, which references the path to the current
# module. In this case, it returns the path to the directory containing the current module.

output "kubeconfig" {
  value       = pathexpand("~/.kube/config")
  description = "The path to the kubeconfig file"
  depends_on = [ minikube_cluster.docker ]
}