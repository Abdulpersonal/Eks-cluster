#
# EKS Cluster Resources
#  * IAM Role to allow EKS service to manage other AWS services
#  * EC2 Security Group to allow networking traffic with EKS cluster
#  * EKS Cluster
#
resource "aws_eks_cluster" "vegadb-ekscluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.vegadb-ekscluster-role.arn
  version = var.eks-cluster-version

  vpc_config {
    security_group_ids = [aws_security_group.vegadb-eks-sg.id]
    subnet_ids         = var.vpc-subnetid
  }

  depends_on = [
    aws_iam_role_policy_attachment.vegadb-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.vegadb-cluster-AmazonEKSVPCResourceController,
  ]
}
