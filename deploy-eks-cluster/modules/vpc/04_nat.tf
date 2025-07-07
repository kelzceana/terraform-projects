# Create elastic IP
resource "aws_eip" "eks-eip" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "eks-nat" {
  allocation_id = aws_eip.eks-eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "eks-NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.eks-igw]
}