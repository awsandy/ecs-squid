# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_nat_gateway.nat-0a13614648f0e5df4:
resource "aws_nat_gateway" "nat-0a13614648f0e5df4" {
  allocation_id     = aws_eip.eipalloc-02410a5fc2f0b05ef.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.subnet-090ea4dad86354a04.id
  tags = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
  tags_all = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
}