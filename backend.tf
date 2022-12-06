terraform {
  backend "s3" {
    bucket = "nome-do-seu-bucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
