variable "cluster-name" {
  type = string
}

variable "eks-cluster-sg" {
  type = string
}

variable "eks-cluster-version" {
  type    = number
}

variable "eks-cluster-sg-tag" {
  type = string
}

variable "eks-cluster-sg-allowed-cidr" {
  type    = list(any)
}

variable "eks-role-name" {
  type = string
}

variable "vpcid" {
  type = string
}

variable "vpc-subnetid" {
  type = list(string)
}


variable "csi-driver-role" {
  type    = string
}