resource "aws_s3_bucket" "default" {
  bucket = var.bucketName
  tags = {
    Name        = var.bucketName
    Environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "default" {
  bucket = aws_s3_bucket.default.id
  acl    = "private"
}

resource "aws_s3_bucket_policy" "default" {
  bucket = aws_s3_bucket.default.id
  policy = templatefile("s3-policy.json", { bucket = var.bucketName })
}
