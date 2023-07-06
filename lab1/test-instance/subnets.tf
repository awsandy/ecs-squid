resource "aws_subnet" "subnet-pub1" {
  vpc_id            = "${aws_vpc.ec2-vpc.id}"
  cidr_block        = "10.1.0.0/27"
  availability_zone = "eu-west-2a"
  
  #Amazon always assigns a /56 subnet to a vpc. 
  #The cidrsubnet(prefix, 8, 1) creates a /64 subnet by appending a byte with the value 1 to that prefix.
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.ec2-vpc.ipv6_cidr_block, 8, 1)}"
  assign_ipv6_address_on_creation=true

  tags = {
    Name = "subnet-pub1"
  }
}

resource "aws_subnet" "subnet-priv1" {
  vpc_id            = "${aws_vpc.ec2-vpc.id}"
  cidr_block        = "10.1.0.128/27"
  availability_zone = "eu-west-2a"
  
  #Amazon always assigns a /56 subnet to a vpc. 
  #The cidrsubnet(prefix, 8, 1) creates a /64 subnet by appending a byte with the value 1 to that prefix.
  ipv6_cidr_block = "${cidrsubnet(aws_vpc.ec2-vpc.ipv6_cidr_block, 8, 2)}"
  assign_ipv6_address_on_creation=true

  tags = {
    Name = "subnet-priv1"
  }
}