resource "aws_eip" "eip-natgw" {
  #instance = "${aws_instance.ec2-priv-1.id}"
  vpc      = true
  tags = {
    Name = "eip-natgw"
  }

}