data "aws_vpc" "vpc-default" {
  default = true
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.vpc-default.id
  filter {
    name   = "tag:workshop"
    values = ["eks-terraform"]
  }
}

resource "aws_vpc_peering_connection" "def-peer" {
  peer_vpc_id = aws_vpc.vpc-090fcf5a7a3b94d20.id
  vpc_id      = data.aws_vpc.vpc-default.id
  auto_accept = true
}

output "peerid" {
  value = aws_vpc_peering_connection.def-peer.id
}

# default to squid
resource "aws_route" "rt-def" {
  route_table_id            = data.aws_vpc.vpc-default.main_route_table_id
  destination_cidr_block    = aws_vpc.vpc-090fcf5a7a3b94d20.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

#  squid to default aws_route_table" "rtb-00c2a3920ce34d43f priv1
resource "aws_route" "rt-squid1" {
  route_table_id            = aws_route_table.rtb-00c2a3920ce34d43f.id
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

#  squid to default "aws_route_table" "rtb-067ca9457ae19f31d" priv2
resource "aws_route" "rt-squid2" {
  route_table_id            = aws_route_table.rtb-067ca9457ae19f31d.id
  destination_cidr_block    = data.aws_vpc.vpc-default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_security_group_rule" "vpc-all-in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = aws_security_group.sg-0b7aada9480a491f5.id
}

resource "aws_security_group_rule" "def-all-in" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.vpc-090fcf5a7a3b94d20.cidr_block]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_security_group_rule" "vpc-all-out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = aws_security_group.sg-0b7aada9480a491f5.id
}

resource "aws_security_group_rule" "def-all-out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.vpc-090fcf5a7a3b94d20.cidr_block]
  security_group_id = data.aws_security_group.default.id
}



