resource "aws_s3_bucket" "my-data-bucket" {
  bucket = "my-company-sensitive-data"
  acl    = "public-read" # <---- Insecure configuration
}
