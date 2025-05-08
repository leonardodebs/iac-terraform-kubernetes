variable "nome_repositorio" {
  type = string
}

variable "cluster_name" {
  type        = string
  description = "Nome do Cluster EKS"
  default     = "producao-cluster" 
#  validation {
#    condition     = can(regex("^[0-9A-Za-z][0-9A-Za-z_-]*$", var.cluster_name))
#    error_message = "O nome do cluster deve começar com letra/número e conter apenas letras, números, hífens e sublinhados."
#  }
}