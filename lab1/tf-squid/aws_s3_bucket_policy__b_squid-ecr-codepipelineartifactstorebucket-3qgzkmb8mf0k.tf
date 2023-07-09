# aws_s3_bucket_policy.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k:
resource "aws_s3_bucket_policy" "b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k" {
  bucket = aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.id
  policy = jsonencode(
    {
      Statement = [
        {
          Action = "s3:PutObject"
          Condition = {
            StringNotEquals = {
              "s3:x-amz-server-side-encryption" = "aws:kms"
            }
          }
          Effect    = "Deny"
          Principal = "*"
          Resource = format("%s/*",aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.arn) 
          #Resource  = "arn:aws:s3:::squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k/*"
          Sid       = "DenyUnEncryptedObjectUploads"
        },
        {
          Action = "s3:*"
          Condition = {
            Bool = {
              "aws:SecureTransport" = "false"
            }
          }
          Effect    = "Deny"
          Principal = "*"
          #Resource = [
          #  "arn:aws:s3:::squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k/*",
          #  "arn:aws:s3:::squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k",
          #]
          Resource = [
            format("%s/*",aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.arn),
            format("%s",aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.arn)
          ]

          Sid = "DenyInsecureConnections"
        },
      ]
      Version = "2012-10-17"
    }
  )
}
