resource "aws_vpc" "ec2-vpc" {
  cidr_block = "10.1.0.0/24"
  assign_generated_ipv6_cidr_block=true
  enable_dns_hostnames=true
tags = {
    Name = "test-squid"
  }

}
