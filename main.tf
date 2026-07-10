resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
 tags = {
     app = "frontend"
}
}

variable "bucket_name" {
  type = string
  default = "new-bucket-local-anup-1"
}

output "bucket_name" {
  value = aws_s3_bucket.example.bucket
}
