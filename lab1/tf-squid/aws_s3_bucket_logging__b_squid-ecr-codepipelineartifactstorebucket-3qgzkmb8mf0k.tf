# aws_s3_bucket_logging.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k:
resource "aws_s3_bucket_logging" "b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k" {
  bucket        = aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.id
  target_bucket = aws_s3_bucket.b_squid-ecr-accesslogss3-1hqy0o9c4mhch.id
  target_prefix = "codeartifactstores3"
}
