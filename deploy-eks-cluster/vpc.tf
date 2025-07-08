# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


variable vpc_cidr_blocks {}
variable public_subnet_cidr_blocks {}
variable private_subnet_cidr_blocks {}

data "aws_availability_zones" "azs" {}

module "my-eks-cluster-vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "my-vpc"
  cidr = var.vpc_cidr_blocks
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets = var.public_subnet_cidr_blocks

  azs = data.aws_availability_zones.azs.names


  enable_nat_gateway = true
  enable_vpn_gateway = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"

  }

  public_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/my-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
 