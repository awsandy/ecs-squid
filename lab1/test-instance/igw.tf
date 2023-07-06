resource "aws_internet_gateway" "ec2-pub-igw" {
  vpc_id = "${aws_vpc.ec2-vpc.id}"
}