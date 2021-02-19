##########################
# S3 Resources #
##########################

resource "aws_s3_bucket" "cinema_app_s3_bucket" {
  bucket        = "${local.prefix}-app"
  acl           = "public-read"
  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
  versioning {
    enabled = true
  }
  tags = local.common_tags
}

resource "aws_s3_bucket_policy" "cinema_app_s3_bucket_policy" {
  bucket = aws_s3_bucket.cinema_app_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "cinema_app_s3_bucket_policy"
    Statement = [
      {
        Sid       = "IPAllow"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "arn:aws:s3:::${local.prefix}-app/*",
        ]
      },
    ]
  })
}