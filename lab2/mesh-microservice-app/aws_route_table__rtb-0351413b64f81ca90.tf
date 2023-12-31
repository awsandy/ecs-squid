# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table.rtb-0351413b64f81ca90:
resource "aws_route_table" "rtb-0351413b64f81ca90" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      core_network_arn           = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.igw-0259dc3652d1731a8.id
      instance_id                = null
      ipv6_cidr_block            = null
      local_gateway_id           = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]
  tags = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
  tags_all = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
  vpc_id = aws_vpc.vpc-057a64aaa8d96235b.id
}
