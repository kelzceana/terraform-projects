# Create private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "192.168.0.0/19"
  availability_zone = "us-east-1a"

  tags = {
    Name = "eks-private-subnet"
  }

}


# Create public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "192.168.64.0/19"
  availability_zone = "us-east-1a"

  tags = {
    Name = "eks-private-subnet"
  }
}