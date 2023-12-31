# File generated by aws2tf see https://github.com/aws-samples/aws2tf
resource "aws_lb_listener" "arn_aws_elasticloadbalancing_listener_net_squid" {
  load_balancer_arn = aws_lb.arn_aws_elasticloadbalancing_net_squid.arn
  port              = 3128
  protocol          = "TCP"
  tags              = {}
  tags_all          = {}

  default_action {
    target_group_arn = aws_lb_target_group.arn_aws_elasticloadbalancing_targetgroup_squid-ecr.arn
    type             = "forward"
  }
}
