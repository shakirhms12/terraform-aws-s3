resource "aws_s3_bucket" "private_registry_bucket" {
  bucket = var.name
 
  tags = {
    Environment = var.Environment
    Project     = var.Project
  }

  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.private_registry_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "example" {

  bucket = aws_s3_bucket.private_registry_bucket.id
  acl = "private"
} 

