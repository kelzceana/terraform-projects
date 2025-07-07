module "vpc" {
  source = "../modules/vpc"
  
}

module "eks" {
  source = "../modules/eks"
  private_subnet_id = module.vpc.private_subnet_id
  public_subnet_id = module.vpc.public_subnet_id
}

