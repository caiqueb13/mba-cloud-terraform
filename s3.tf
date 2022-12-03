resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-state-projeto"

  tags = {
    Name        = "terraform-state-projeto"
  }
}

output "bucket-name" {
  value = aws_s3_bucket.terraform-bucket.id
}


output "bucket-arn" {
  value = aws_s3_bucket.terraform-bucket.arn
}
