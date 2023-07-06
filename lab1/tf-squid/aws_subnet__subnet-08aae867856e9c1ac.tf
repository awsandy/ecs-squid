# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_subnet.subnet-08aae867856e9c1ac:
resource "aws_subnet" "subnet-08aae867856e9c1ac" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "eu-west-2a"
  cidr_block                                     = "10.0.1.0/24"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "Private Subnet 1 - squid-ecr"
  }
  tags_all = {
    "Name" = "Private Subnet 1 - squid-ecr"
  }
  vpc_id = aws_vpc.vpc-090fcf5a7a3b94d20.id
}