resource "aws_s3_bucket" "private_registry_bucket" {
  bucket = "private-registry-bucket"
  
  # Ensures the bucket is private
  # Optional: Enable versioning to keep previous versions of the objects in the bucket
  versioning {
    enabled = true
  }

 
  tags = {
    Environment = "Production"
    Project     = "Registry"
  }

  force_destroy = true
}

resource "aws_s3_bucket_acl" "custom_acl" {
  bucket = aws_s3_bucket.private_registry_bucket.bucket

  grants {
        grantee {
      type        = "CanonicalUser"
      id          = "YOUR_CANONICAL_USER_ID"  # Replace with the IAM user's Canonical User ID
      display_name = "iam-user-name"
    }
    permission = "FULL_CONTROL"
  }

}
