# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_eip.eipalloc-09d44506d4717b45d:
resource "aws_eip" "eipalloc-09d44506d4717b45d" {
  network_border_group = "eu-west-1"
  public_ipv4_pool     = "amazon"
  tags = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet1"
  }
  tags_all = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet1"
  }
  vpc = true
}
