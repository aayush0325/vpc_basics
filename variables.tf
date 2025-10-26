variable "aws_region" {
  description = "region for aws resources"
  type        = string
}

variable "aws_access_key" {
  description = "access key for aws"
  sensitive   = true
  type        = string
}

variable "aws_secret_key" {
  description = "secret key for aws"
  sensitive   = true
  type        = string
}
