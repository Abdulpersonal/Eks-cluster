#
# EKS Worker Nodes Resources
#  * IAM role allowing Kubernetes actions to access other AWS services
#  * EKS Node Group to launch worker nodes
#
resource "aws_eks_node_group" "vegadb-eks-workernode" {
  cluster_name    = var.clustername
  node_group_name = var.node_group_name
  instance_types  = [var.instance-types]
  node_role_arn   = aws_iam_role.eks-workernode-role.arn
  subnet_ids      = "${var.vpc-subnetid}"

  scaling_config {
    desired_size = var.workernode-desired_size
    max_size     = var.workernode-max_size
    min_size     = var.workernode-min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.vegadb-worker-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.vegadb-worker-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.vegadb-worker-node-AmazonEC2ContainerRegistryReadOnly,
  ]
}
