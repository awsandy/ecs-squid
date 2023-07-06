output "dns" {
  value = "${aws_eip.eip-natgw.*.public_dns}"
}
output "ipv6" {
  value = "${aws_instance.ec2-priv-1.*.ipv6_addresses}"
}

output "instanceid" {
    value = "${aws_instance.ec2-priv-1.*.id}"
}
#output "activation-id" {
#    value = "${aws_ssm_activation.foo.*.id}"
#}
#output "activation-code" {
#    value = "${aws_ssm_activation.foo.*.activation_code}"
#}