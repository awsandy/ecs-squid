# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-0f7e3ec5d7c01ab3b_ingress_2:
resource "aws_security_group_rule" "sg-0f7e3ec5d7c01ab3b_ingress_2" {
  from_port         = 3000
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-0f7e3ec5d7c01ab3b.id
  self              = true
  to_port           = 3000
  type              = "ingress"
}
