terraform {
  backend "s3" {
    bucket = "terraform-tfstate-data-dev"
    key    = "dev-terraform.tfstate"
    region = "eu-west-3"
  }
}
