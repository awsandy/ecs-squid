# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_eip.eipalloc-02410a5fc2f0b05ef:
resource "aws_eip" "eipalloc-02410a5fc2f0b05ef" {
  network_border_group = "eu-west-2"
  public_ipv4_pool     = "amazon"
  tags = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
  tags_all = {
    "Name" = "ecsworkshop-base/BaseVPC/PublicSubnet2"
  }
  vpc = true
}