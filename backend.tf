terraform {
  backend "s3" {
    bucket = "terraform-state-block"
    key    = "terraform/terraform.tfstate"
    region = "sa-east-1"
  }
}
