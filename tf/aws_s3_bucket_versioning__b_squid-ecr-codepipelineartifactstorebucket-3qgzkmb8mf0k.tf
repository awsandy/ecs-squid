# aws_s3_bucket_versioning.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k:
resource "aws_s3_bucket_versioning" "b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k" {
  bucket = aws_s3_bucket.b_squid-ecr-codepipelineartifactstorebucket-3qgzkmb8mf0k.id

  versioning_configuration {
    status = "Enabled"
  }
}
