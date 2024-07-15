provider "aws" {
  region = var.region
  shared_config_files = [ "C:/Users/ADMIN/.aws/config" ]
  shared_credentials_files = [ "C:/Users/ADMIN/.aws/credentials" ]
  profile = "default"
}