# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table.rtb-04df3b5a592773c27:
resource "aws_route_table" "rtb-04df3b5a592773c27" {
  propagating_vgws = []
  route = [
    {
      carrier_gateway_id         = ""
      cidr_block                 = "0.0.0.0/0"
      core_network_arn           = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = aws_internet_gateway.igw-06bb834c9146068a8.id
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
    "Name" = "Public Route Table- squid-ecr"
  }
  tags_all = {
    "Name" = "Public Route Table- squid-ecr"
  }
  vpc_id = aws_vpc.vpc-090fcf5a7a3b94d20.id
}