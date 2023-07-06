resource "aws_ssm_parameter" "meshlb-dns" {
  name        = "/ecsworkshop/meshlb-dns"
  description = "The mesh lb dns"
  type        = "String"
  value       = aws_lb.arn_aws_elasticloadbalancing_eu-west-2_566972129213_loadbalancer_net_ecswo-MeshG-FLLW6SVH5ZXC_931d0198707acc37.dns_name
  tags = {
    workshop = "ecs-workshop"
  }
}