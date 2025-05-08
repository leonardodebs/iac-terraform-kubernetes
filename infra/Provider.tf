terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.95.0"
    }
  }

  required_version = ">= 1.5.0" 
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type        = string
  description = "Região AWS"
  default     = "us-west-2" 
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

data "aws_eks_cluster_auth" "default" {
  name = module.eks.cluster_name
}