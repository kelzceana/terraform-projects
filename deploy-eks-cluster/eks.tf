module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.17.2"

  cluster_name = "my-eks-cluster"
  cluster_version = "1.30"

  subnet_ids = module.my-eks-cluster-vpc.private_subnets
  vpc_id = module.my-eks-cluster-vpc.vpc_id

  tags = {
    env = "dev"
  }

  #node group configuration
   eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 3
      desired_size = 2

      instance_types = ["t2.small"]
    }
  }

  
}