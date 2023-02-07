output "vpcid" {
  value = aws_vpc.vegadb-customvpc.id
}

output "vpc-subnetid" {
  #value = ["${aws_subnet.demo[*].id}"]
  value=[aws_subnet.vpc-subnet1.id,aws_subnet.vpc-subnet2.id]
}


output "vpc-subnet1" {
  value = aws_subnet.vpc-subnet1.id
  
}

output "vpc-subnet2" {
  value = aws_subnet.vpc-subnet2.id
  
}

output "routevpc-A" {
  value = aws_route_table.vpc-custom-routetable
}