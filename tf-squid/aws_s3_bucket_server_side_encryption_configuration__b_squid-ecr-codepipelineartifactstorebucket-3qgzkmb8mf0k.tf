# aws_s3_bucket_server_side_encryption_configuration.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k:
resource "aws_s3_bucket_server_side_encryption_configuration" "b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k" {
  bucket = aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
