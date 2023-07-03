# aws_s3_bucket_versioning.b_squid-ecr-accesslogss3-1hqy0o9c4mhch:
resource "aws_s3_bucket_versioning" "b_squid-ecr-accesslogss3-1hqy0o9c4mhch" {
  bucket = aws_s3_bucket.b_squid-ecr-accesslogss3-1hqy0o9c4mhch.id

  versioning_configuration {
    status = "Enabled"
  }
}
