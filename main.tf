module "customvpc" {
  source          = "./VPC"
  vpcname         = var.vpcname
  internetgateway = var.internetgateway
  cidrblock       = var.cidrblock
  cluster-name    = var.cluster-name
  subnet1name=var.subnet1name
  subnet2name=var.subnet2name
  subnet1=var.subnet1
  subnet2=var.subnet2
}

module "custom-ekscluster" {
  source                      = "./EKS-Cluster"
  #cidrblock                   = var.cidrblock
  cluster-name                = var.cluster-name
  eks-cluster-sg              = var.eks-cluster-sg
  eks-cluster-sg-tag          = var.eks-cluster-sg-tag
  eks-cluster-sg-allowed-cidr = var.eks-cluster-sg-allowed-cidr
  eks-role-name               = var.eks-role-name
  vpcid                       = module.customvpc.vpcid
  vpc-subnetid                = module.customvpc.vpc-subnetid
  eks-cluster-version         = 1.24
  csi-driver-role=var.csi-driver-role
  
}

module "custom-workernode" {
  source                  = "./Workernode"
  workernode-desired_size = var.workernode-desired_size
  workernode-max_size     = var.workernode-max_size
  workernode-min_size     = var.workernode-min_size
  node_group_name         = var.node_group_name
  node-role               = var.node-role
  vpcid                   = module.customvpc.vpcid
  vpc-subnetid            = module.customvpc.vpc-subnetid
  clustername             = module.custom-ekscluster.ekscluster-name
  instance-types          = var.instance-types
}