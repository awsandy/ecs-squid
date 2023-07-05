# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_subnet.subnet-0b7ccfbce3d25d6ad:
resource "aws_subnet" "subnet-0b7ccfbce3d25d6ad" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "eu-west-2b"
  cidr_block                                     = "10.0.0.128/27"
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name"                = "ecsworkshop-base/BaseVPC/PrivateSubnet2"
    "aws-cdk:subnet-name" = "Private"
    "aws-cdk:subnet-type" = "Private"
  }
  tags_all = {
    "Name"                = "ecsworkshop-base/BaseVPC/PrivateSubnet2"
    "aws-cdk:subnet-name" = "Private"
    "aws-cdk:subnet-type" = "Private"
  }
  vpc_id = aws_vpc.vpc-057a64aaa8d96235b.id
}
