provider "aws" {
  region  = "eu-west-3"
  profile = "aws_user"

  default_tags {
    tags = local.aws_tags_global
  }
}
