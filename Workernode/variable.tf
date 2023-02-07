variable "workernode-desired_size" {
  type = number
}

variable "workernode-max_size" {
  type = number
}

variable "workernode-min_size" {
  type = number
}

variable "node_group_name" {
  type = string
}

variable "node-role" {
  type = string
}

variable "vpcid" {
  type = string
}

variable "vpc-subnetid" {
  type = list(string)
}

variable "clustername" {
  type = string
}

variable "instance-types" {
  type = string
}