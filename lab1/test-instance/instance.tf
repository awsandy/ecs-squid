resource "aws_instance" "ec2-priv-1" {
  ami = "${data.aws_ami.amazon_linux.id}"
  instance_type = "t3.large"
  #key_name = "${aws_key_pair.terraform-andyt.key_name}"
  user_data = "${file("setup.sh")}"

  #only use for default vpc and classic ec2 
  #security_groups = ["${aws_security_group.ingress-at.id}"]
  
  vpc_security_group_ids=["${aws_security_group.ingress-at.id}"]
  subnet_id = "${aws_subnet.subnet-priv1.id}"
  ipv6_address_count=1
  monitoring=false
  disable_api_termination=false
  ebs_optimized=false
#
 iam_instance_profile="${aws_iam_instance_profile.test_profile.name}"
#

  credit_specification {
    # normally "unlimited"
    cpu_credits = "standard"
  }

#depends_on = ["aws_nat_gateway.nat-gw"]

tags = {
    Name = "test-squid"
  }

}