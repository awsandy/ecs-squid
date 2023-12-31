# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_subnet.subnet-06a1663084c09f60b:
resource "aws_subnet" "subnet-06a1663084c09f60b" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "eu-west-1a"
  cidr_block                                     = "10.0.0.0/27"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "Public Subnet 1 - squid-ecr"
  }
  tags_all = {
    "Name" = "Public Subnet 1 - squid-ecr"
  }
  vpc_id = aws_vpc.vpc-090fcf5a7a3b94d20.id
}
