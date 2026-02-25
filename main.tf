resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-very-secret-data-bucket"
}

resource "aws_s3_bucket" "insecure_bucket_log_bucket" {
  bucket = "insecure_bucket-log-bucket"
}

resource "aws_s3_bucket_logging" "insecure_bucket" {
  bucket = aws_s3_bucket.insecure_bucket.id

  target_bucket = aws_s3_bucket.insecure_bucket_log_bucket.id
  target_prefix = "log/"
}

# ISSUE: Public access allowed
resource "aws_s3_bucket_public_access_block" "bad_idea" {
  bucket = aws_s3_bucket.insecure_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ISSUE: ACL set to public-read
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.insecure_bucket.id
  acl    = "public-read"
}
