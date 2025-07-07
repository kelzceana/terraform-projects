# Create node group for eks cluster
resource "aws_eks_node_group" "eks-node-group" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "my-eks-node-group"
  node_role_arn   = aws_iam_role.eks-node-role.arn
  subnet_ids      = [var.private_subnet_id]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-node-policy,
    aws_iam_role_policy_attachment.eks-container-registry-policy,
    aws_iam_role_policy_attachment.eks-cni-policy

  ]
}