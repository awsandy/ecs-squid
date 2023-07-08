# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group_rule.sg-06eef3d0bbb93d60e_ingress_1:
resource "aws_security_group_rule" "sg-06eef3d0bbb93d60e_ingress_1" {
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description       = "Allow TCP connections on port 3000"
  from_port         = 3000
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-06eef3d0bbb93d60e.id
  to_port           = 3000
  type              = "ingress"
}

resource "aws_security_group_rule" "sg-06eef3d0bbb93d60e_ingress_2" {
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description       = "Allow TCP connections on port 8080"
  from_port         = 8080
  prefix_list_ids   = []
  protocol          = "tcp"
  security_group_id = aws_security_group.sg-06eef3d0bbb93d60e.id
  to_port           = 8080
  type              = "ingress"
}
