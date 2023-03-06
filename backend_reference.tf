#store the terraform state file in s3   
#https://developer.hashicorp.com/terraform/language/settings/backends/s3

terraform {
  backend "s3" {
    bucket = "value"
    key = "value"
    region = "value"
    # profile = "value"
  }
}