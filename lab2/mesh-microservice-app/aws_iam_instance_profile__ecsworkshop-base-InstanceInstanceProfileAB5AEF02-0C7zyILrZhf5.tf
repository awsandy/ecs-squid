# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_iam_instance_profile.ecsworkshop-base-InstanceInstanceProfileAB5AEF02-0C7zyILrZhf5:
resource "aws_iam_instance_profile" "ecsworkshop-base-InstanceInstanceProfileAB5AEF02-0C7zyILrZhf5" {
  name     = "ecsworkshop-base-InstanceInstanceProfileAB5AEF02-0C7zyILrZhf5"
  path     = "/"
  role     = aws_iam_role.r-ecsworkshop-base-InstanceSSMCBFA3CF0-N0K8YHX2VEUM.name
  tags     = {}
  tags_all = {}
}