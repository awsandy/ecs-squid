resource "aws_route_table" "route-table-pub" {
  vpc_id = "${aws_vpc.ec2-vpc.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ec2-pub-igw.id}"
    #nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
  }
#route {
#    ipv6_cidr_block = "::/0"
#    #gateway_id = "${aws_internet_gateway.ec2-pub-igw.id}"
#    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
#}

tags = {
    Name = "route-table-pub"
  }
}

resource "aws_route_table" "route-table-priv" {
  vpc_id = "${aws_vpc.ec2-vpc.id}"
route {
    cidr_block = "0.0.0.0/0"
    #gateway_id = "${aws_internet_gateway.ec2-pub-igw.id}"
    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
  }
#route {
#    ipv6_cidr_block = "::/0"
#    #gateway_id = "${aws_internet_gateway.ec2-pub-igw.id}"
#    nat_gateway_id = "${aws_nat_gateway.nat-gw.id}"
#}

tags = {
    Name = "route-table-pub"
  }
}




resource "aws_route_table_association" "subnetpub-association" {
  subnet_id      = "${aws_subnet.subnet-pub1.id}"
  route_table_id = "${aws_route_table.route-table-pub.id}"
}

resource "aws_route_table_association" "subnetpriv-association" {
  subnet_id      = "${aws_subnet.subnet-priv1.id}"
  route_table_id = "${aws_route_table.route-table-priv.id}"
}