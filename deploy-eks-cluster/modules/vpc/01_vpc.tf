# Create a VPC
resource "aws_vpc" "eks-vpc" {
  cidr_block = "192.168.0.0/16"
}