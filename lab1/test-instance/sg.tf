//security.tf
resource "aws_security_group" "ingress-at" {
name = "allow-at-sg"
vpc_id = "${aws_vpc.ec2-vpc.id}"
ingress {
    cidr_blocks = [
      "81.101.169.53/32"
    ]
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default egress rule - so add it back in
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
    Name = "allow-at-sg"
  }
}