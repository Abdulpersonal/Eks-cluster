variable "aws_region" {
  default = "ap-south-1"
}



#VPC Variables

variable "vpcname" {
  type    = string
}

variable "cidrblock" {
  type    = string
  #default="10.16.0.0/16"
}

variable "subnet1name" {
  type    = string
}

variable "subnet2name" {
  type    = string
}

variable "subnet1" {
  type    = string
}

variable "subnet2" {
  type    = string
}

variable "internetgateway" {
  type    = string
}




#EKS cluster variable

variable "cluster-name" {
  type    = string
}


variable "instance-types" {
  default = "t3.medium"
}


variable "eks-cluster-sg" {
  type    = string
}

variable "eks-cluster-sg-tag" {
  type    = string
}

variable "eks-cluster-sg-allowed-cidr" {
  type    = list(any)
}

variable "eks-role-name" {
  type    = string
  
}


#eks worker node 

variable "workernode-desired_size" {
  type    = number
  default=2
}

variable "workernode-max_size" {
  type    = number
  default=2
}

variable "workernode-min_size" {
  type    = number
  default=2
}

variable "node_group_name" {
  type    = string
}

variable "node-role" {
  type    = string
  #default="test-dev-vega-eks-node"
}

variable "csi-driver-role" {
  type    = string
}