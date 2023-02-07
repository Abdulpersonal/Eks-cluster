output "ekscluster-name" {
  value = aws_eks_cluster.vegadb-ekscluster.name
}

output "eksendpoint"{
  value=aws_eks_cluster.vegadb-ekscluster.endpoint
}

output "cluster-certificateauth"{
  value= "${aws_eks_cluster.vegadb-ekscluster.certificate_authority[0].data}"
}