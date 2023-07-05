# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_appautoscaling_policy.ecs__service_container-demo_ecsdemo-nodejs__ecs_service_DesiredCount__ecsworkshopnodejsNodejsFargateServiceTaskCountTargetCPUAutoscaling4708BC1E:
resource "aws_appautoscaling_policy" "ecs__service_container-demo_ecsdemo-nodejs__ecs_service_DesiredCount__ecsworkshopnodejsNodejsFargateServiceTaskCountTargetCPUAutoscaling4708BC1E" {
  name               = "ecsworkshopnodejsNodejsFargateServiceTaskCountTargetCPUAutoscaling4708BC1E"
  policy_type        = "TargetTrackingScaling"
  resource_id        = "service/container-demo/ecsdemo-nodejs"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  target_tracking_scaling_policy_configuration {
    disable_scale_in   = false
    scale_in_cooldown  = 30
    scale_out_cooldown = 30
    target_value       = 50

    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
  }
}
