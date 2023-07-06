data "aws_security_group" "sg-0cdd9ddeb01bf7452" {
  name   = "default"
  vpc_id = aws_vpc.vpc-057a64aaa8d96235b.id
}
