resource "aws_security_group" "vegadb-eks-sg" {
  name        = var.eks-cluster-sg
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpcid

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.eks-cluster-sg-tag
  }
}

resource "aws_security_group_rule" "vegadb-sg-rule" {
  #cidr_blocks       = [local.workstation-external-cidr]
  cidr_blocks       = var.eks-cluster-sg-allowed-cidr
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.vegadb-eks-sg.id
  to_port           = 443
  type              = "ingress"
}