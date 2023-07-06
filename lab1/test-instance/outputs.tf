output "dns" {
  value = "${aws_eip.eip-natgw.*.public_dns}"
}
output "ipv6" {
  value = "${aws_instance.ec2-priv-1.*.ipv6_addresses}"
}

output "instanceid" {
    value = "${aws_instance.ec2-priv-1.*.id}"
}


output "squid-endpoint" {
  value = tolist(aws_vpc_endpoint_service.vpce-svc-09041d05a3a2059cc.base_endpoint_dns_names)[0]
}
#output "activation-id" {
#    value = "${aws_ssm_activation.foo.*.id}"
#}
#output "activation-code" {
#    value = "${aws_ssm_activation.foo.*.activation_code}"
#}