terraform {
  backend "s3" {
    bucket = "terraform-state-projeto"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
