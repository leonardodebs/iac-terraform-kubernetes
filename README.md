


# IaC com Terraform e Kubernetes

Repositório com um projeto completo de **Infraestrutura como Código (IaC)** utilizando **Terraform** para provisionamento de recursos em nuvem e **Kubernetes** para orquestração de contêineres.

## 📦 Tecnologias Utilizadas

- [Terraform](https://www.terraform.io/) – Provisionamento da infraestrutura
- [Kubernetes](https://kubernetes.io/) – Orquestração de contêineres
- [AWS](https://aws.amazon.com/) (ou outro provedor) – Infraestrutura em nuvem
- [kubectl](https://kubernetes.io/docs/reference/kubectl/) – Gerenciamento do cluster
- [Helm](https://helm.sh/) (opcional) – Gerenciamento de pacotes no Kubernetes





## 🚀 Objetivo

Automatizar a criação de infraestrutura escalável e resiliente para aplicações containerizadas, com foco em:

- Criação de redes, subnets e instâncias via Terraform
- Deploy de aplicações em um cluster Kubernetes
- Uso de arquivos `.tf` modulares e reutilizáveis
- Organização dos manifests YAML por função (Deployments, Services, etc.)

## ⚙️ Pré-requisitos

Antes de iniciar, você precisa ter instalado:

- Terraform >= 1.0
- kubectl
- AWS CLI configurado (ou outro provedor suportado)
- Acesso a um cluster Kubernetes

## 🛠️ Como usar

```bash
# Clone o repositório
git clone https://github.com/leonardodebs/iac-terraform-kubernetes.git
cd iac-terraform-kubernetes

# Inicialize o Terraform
cd terraform
terraform init

# Visualize e aplique o plano
terraform plan
terraform apply

# Acesse o diretório Kubernetes e aplique os manifests
cd ../kubernetes
kubectl apply -f deployments/
kubectl apply -f services/
````




