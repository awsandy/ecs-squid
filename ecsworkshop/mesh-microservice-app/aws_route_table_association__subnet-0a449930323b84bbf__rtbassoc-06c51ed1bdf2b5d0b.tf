# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table_association.subnet-0a449930323b84bbf__rtbassoc-06c51ed1bdf2b5d0b:
resource "aws_route_table_association" "subnet-0a449930323b84bbf__rtbassoc-06c51ed1bdf2b5d0b" {
  route_table_id = aws_route_table.rtb-0b709fe435360cdfb.id
  subnet_id      = aws_subnet.subnet-0a449930323b84bbf.id
}
