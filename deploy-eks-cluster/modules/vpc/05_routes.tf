#Create public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }


  tags = {
    Name = "public"
  }
}


#Create private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks-nat.id
  }

  tags = {
    Name = "private"
  }
}

# routing table association

resource "aws_main_route_table_association" "private" {
  vpc_id = aws_vpc.eks-vpc.id
  #subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
resource "aws_main_route_table_association" "public" {
  vpc_id = aws_vpc.eks-vpc.id
  #subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}