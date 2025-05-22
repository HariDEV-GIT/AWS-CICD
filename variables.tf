variable "aws_credential_file" {
  type    = string
  default = "~/.aws/credentials"
}

variable "aws_profile" {
  type    = string
  default = null
}

variable "project_prefix" {
  type    = string
  default = "techops"
}

variable "environment" {
  type        = string
  description = "Environment label (i.e. dev, sit, uat, prd)"
  validation {
    condition     = contains(["dev", "sit", "uat", "prd"], var.environment)
    error_message = "Invalid environment variable provided."
  }
}

variable "aws_tags_user" {
  type        = map(any)
  description = "Mappings for the resource"
}

locals {
  aws_tags_global = merge(
    var.aws_tags_user,
    {
      Name          = "Hari"
    }
  )
}

variable "aws_region" {
  type    = string
  default = "eu-west-3"
}

variable "aws_account_number" {
  type = string
}
