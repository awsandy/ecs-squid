# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table_association.subnet-0b7ccfbce3d25d6ad__rtbassoc-086e654b83ec5b3c3:
resource "aws_route_table_association" "subnet-0b7ccfbce3d25d6ad__rtbassoc-086e654b83ec5b3c3" {
  route_table_id = aws_route_table.rtb-0a4eb717ce0ad177a.id
  subnet_id      = aws_subnet.subnet-0b7ccfbce3d25d6ad.id
}
