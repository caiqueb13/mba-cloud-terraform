resource "aws_s3_bucket" "terraform-bucket" {
  bucket = "terraform-state-projeto"

  tags = {
    Name        = "terraform-state-projeto"
  }
}
