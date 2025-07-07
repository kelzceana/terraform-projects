# Create EKS cluster
resource "aws_eks_cluster" "eks-cluster" {
  name = "my-eks-cluster"

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = [
      var.public_subnet_id,
      var.private_subnet_id
    ]
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster,
  ]
}