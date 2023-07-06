resource "aws_nat_gateway" "nat-gw" {
  //other arguments
  allocation_id = "${aws_eip.eip-natgw.id}"
  subnet_id     = "${aws_subnet.subnet-pub1.id}"
  depends_on = [aws_internet_gateway.ec2-pub-igw]
}