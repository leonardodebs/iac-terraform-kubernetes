module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = var.cluster_name
  cluster_version                 = "1.28"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access = true

  

  # VPC Configuration'
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  
 # Node Groups
  eks_managed_node_groups = {
      alura = {
      min_size     = 2
      max_size     = 5
      desired_size = 3
      vpc_security_group_ids = [aws_security_group.ssh_cluster.id]
      instance_types = ["t2.micro"]
      
    }
  }
}