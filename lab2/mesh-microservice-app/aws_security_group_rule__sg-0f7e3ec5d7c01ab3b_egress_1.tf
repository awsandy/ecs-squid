# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0f7e3ec5d7c01ab3b_egress_1:
resource "aws_security_group_rule" "sg-0f7e3ec5d7c01ab3b_egress_1" {
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description       = "Allow all outbound traffic by default"
  from_port         = 0
  prefix_list_ids   = []
  protocol          = "-1"
  security_group_id = aws_security_group.sg-0f7e3ec5d7c01ab3b.id
  to_port           = 0
  type              = "egress"
}