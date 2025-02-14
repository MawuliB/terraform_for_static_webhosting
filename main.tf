provider "aws" {
    region = var.aws_region
}

resource "aws_s3_bucket" "static_website" {
    bucket = "tf-bucket-website-mb"

    website {
        index_document = "index.html"
        error_document = "error.html"
    }

    tags = {
        Name = "StaticWebsiteBucket"
    }
}

resource "aws_s3_bucket_public_access_block" "static_website" {
    bucket = aws_s3_bucket.static_website.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_policy" {
    bucket = aws_s3_bucket.static_website.id

    depends_on = [aws_s3_bucket_public_access_block.static_website]

    policy = jsonencode({
        Version = "2012-10-17",
        Statement = [
            {
                Sid         = "PublicReadGetObject",
                Effect      = "Allow",
                Principal   = "*",
                Action      = "s3:GetObject",
                Resource    = ["${aws_s3_bucket.static_website.arn}",
                                "${aws_s3_bucket.static_website.arn}/*"]
            }
        ]
    })
}

resource "aws_s3_bucket_object" "index" {
    bucket = aws_s3_bucket.static_website.bucket
    key    = "index.html"
    source = "index.html"
    content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
    bucket = aws_s3_bucket.static_website.bucket
    key    = "error.html"
    source = "error.html"
    content_type = "text/html"
}