# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group.sg-0b7aada9480a491f5:
resource "aws_security_group" "sg-0b7aada9480a491f5" {
  description = "ECS Service Security Group"
  tags        = {}
  tags_all    = {}
  vpc_id      = aws_vpc.vpc-090fcf5a7a3b94d20.id
}
