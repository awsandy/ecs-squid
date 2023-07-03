# aws_s3_bucket_server_side_encryption_configuration.b_squid-ecr-accesslogss3-1hqy0o9c4mhch:
resource "aws_s3_bucket_server_side_encryption_configuration" "b_squid-ecr-accesslogss3-1hqy0o9c4mhch" {
  bucket = aws_s3_bucket.b_squid-ecr-accesslogss3-1hqy0o9c4mhch.id

  rule {
    bucket_key_enabled = false

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
