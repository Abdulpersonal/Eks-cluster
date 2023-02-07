#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

data "aws_availability_zones" "available" {}

resource "aws_vpc" "vegadb-customvpc" {
  cidr_block = var.cidrblock

  tags = tomap({
    "Name"                                      = "${var.vpcname}",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

# resource "aws_subnet" "demo" {
#   #count = 2

#   availability_zone       = data.aws_availability_zones.available.names[count.index]
#   cidr_block              = "10.0.${count.index}.0/24"
#   map_public_ip_on_launch = true
#   vpc_id                  = aws_vpc.demo.id

#   tags = tomap({
#     "Name"                                      = "${var.subnetname}",
#     "kubernetes.io/cluster/${var.cluster-name}" = "shared",
#   })
# }


resource "aws_subnet" "vpc-subnet1" {
  availability_zone       = data.aws_availability_zones.available.names[1]
  cidr_block              = var.subnet1
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vegadb-customvpc.id

  tags = tomap({
    "Name"                                      = "${var.subnet1name}",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_subnet" "vpc-subnet2" {

  availability_zone       = data.aws_availability_zones.available.names[2]
  cidr_block              = var.subnet2
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vegadb-customvpc.id

  tags = tomap({
    "Name"                                      = "${var.subnet2name}",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
  })
}

resource "aws_internet_gateway" "vegadb-Igw" {
  vpc_id = aws_vpc.vegadb-customvpc.id

  tags = {
    Name = var.internetgateway
  }
}

resource "aws_route_table" "vpc-custom-routetable" {
  vpc_id = aws_vpc.vegadb-customvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vegadb-Igw.id
  }
}

resource "aws_route_table_association" "vpc-custom-route-map" {
  #count = 2

  subnet_id      = aws_subnet.vpc-subnet1.id
  route_table_id = aws_route_table.vpc-custom-routetable.id
}

resource "aws_route_table_association" "vpc-custom-route-map2" {
  #count = 2

  #subnet_id      = "$${aws_subnet.subnet${count.index}.id}"
  subnet_id      = aws_subnet.vpc-subnet2.id
  route_table_id = aws_route_table.vpc-custom-routetable.id
}