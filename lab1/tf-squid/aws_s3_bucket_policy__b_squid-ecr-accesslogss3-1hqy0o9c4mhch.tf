# aws_s3_bucket_policy.b_squid-ecr-accesslogss3-1hqy0o9c4mhch:
resource "aws_s3_bucket_policy" "b_squid-ecr-accesslogss3-1hqy0o9c4mhch" {
  bucket = aws_s3_bucket.b_squid-ecr-accesslogss3-1hqy0o9c4mhch.id
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "s3:*"
          Condition = {
            Bool = {
              "aws:SecureTransport" = "false"
            }
          }
          Effect    = "Deny"
          Principal = "*"
          Resource = [
            "arn:aws:s3:::squid-ecr-accesslogss3*",
          ]
          Sid = "Denyhttp"
        },
        {
          Action = "s3:PutObject"
          Condition = {
            StringEquals = {
              "s3:x-amz-acl" = "bucket-owner-full-control"
            }
          }
          Effect = "Allow"
          Principal = {
            Service = "delivery.logs.amazonaws.com"
          }
          Resource = "arn:aws:s3:::squid-ecr-accesslogss3*"
          Sid      = "AWSLogDeliveryWrite"
        },
        {
          Action = "s3:GetBucketAcl"
          Effect = "Allow"
          Principal = {
            Service = "delivery.logs.amazonaws.com"
          }
          Resource = "arn:aws:s3:::squid-ecr-accesslogss3*"
          Sid      = "AWSLogDeliveryAclCheck"
        },
        {
          Action = "s3:PutObject"
          Condition = {
            ArnLike = {
              "aws:SourceArn" = "arn:aws:s3:::squid-ecr-*"
            }
            StringEquals = {
              "aws:SourceAccount" = data.aws_caller_identity.current.account_id
            }
          }
          Effect = "Allow"
          Principal = {
            Service = "logging.s3.amazonaws.com"
          }
          Resource = "arn:aws:s3:::squid-ecr-accesslogss3*"
          Sid      = "S3ServerAccessLogsPolicy"
        },
      ]
      Version = "2012-10-17"
    }
  )
}
