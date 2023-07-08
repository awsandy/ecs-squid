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
  destination_cidr_block    = aws_vpc.vpc-090fcf5a7a3b94d20.eks-cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

#  squid to default
resource "aws_route" "rt-squid" {
  route_table_id            = aws_route_table.rtb-00c2a3920ce34d43f.id
  destination_cidr_block    = data.aws_vpc.vpc-default.eks-cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.def-peer.id
}

resource "aws_security_group_rule" "vpc-443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = aws_security_group.sg-0b7aada9480a491f5.id
}

resource "aws_security_group_rule" "def-443" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.vpc-090fcf5a7a3b94d20.cidr_block]
  security_group_id = data.aws_security_group.default.id
}

resource "aws_security_group_rule" "vpc-8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = aws_security_group.sg-0b7aada9480a491f5.id
}

resource "aws_security_group_rule" "def-8080" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.vpc-090fcf5a7a3b94d20.cidr_block]
  security_group_id = data.aws_security_group.default.id
}


resource "aws_security_group_rule" "vpc-3128" {
  type              = "ingress"
  from_port         = 3128
  to_port           = 3128
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc-default.cidr_block]
  security_group_id = aws_security_group.sg-0b7aada9480a491f5.id
}

resource "aws_security_group_rule" "def-3128" {
  type              = "ingress"
  from_port         = 3128
  to_port           = 3128
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.vpc-090fcf5a7a3b94d20.cidr_block]
  security_group_id = data.aws_security_group.default.id
}