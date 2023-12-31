# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_cloudwatch_event_rule.default__squid-ecr-CodeCommitChangeEventRule-1GAJZHZAR2R5E:
resource "aws_cloudwatch_event_rule" "default__squid-ecr-CodeCommitChangeEventRule-1GAJZHZAR2R5E" {
  event_bus_name = "default"
  event_pattern = jsonencode(
    {
      detail = {
        event = [
          "referenceCreated",
          "referenceUpdated",
        ]
        referenceName = [
          "main",
        ]
        referenceType = [
          "branch",
        ]
      }
      detail-type = [
        "CodeCommit Repository State Change",
      ]
      resources = [
        format("arn:aws:codecommit:%s:%s:squid-proxy", data.aws_region.current.name, data.aws_caller_identity.current.account_id)
      ]
      source = [
        "aws.codecommit",
      ]
    }
  )
  is_enabled = true
  name       = "squid-ecr-CodeCommitChangeEventRule-1GAJZHZAR2R5E"
  tags       = {}
  tags_all   = {}
}
