
##################################################################################
# S3 RESOURCE
##################################################################################

resource "aws_s3_bucket" "s3_bucket" {
  count  = length(var.s3_bucket)
  bucket = var.s3_bucket[count.index]
  acl    = "private"
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
  versioning {
    enabled = var.versioning
  }

  tags = {
    project      = var.project
    spoc         = var.spoc
    created_date = var.created_date
  }

  logging {
   target_bucket = var.log_bucket[0]
    target_prefix = var.log_bucket_target_prefix
  }

 lifecycle_rule {
    enabled = true
    id = "INTELLIGENT_TIERING"
    abort_incomplete_multipart_upload_days = 1

    expiration {
      expired_object_delete_marker = true
    }

    transition {
          days          = 0
          storage_class = "INTELLIGENT_TIERING"
          }
    noncurrent_version_transition {
          days          = 0
          storage_class = "INTELLIGENT_TIERING"
      }
 }

}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  count  = length(var.s3_bucket)
  bucket = aws_s3_bucket.s3_bucket[count.index].id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}




