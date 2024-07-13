provider "aws" {
  shared_config_files = [ "C:/Users/ADMIN/.aws/config" ]
  shared_credentials_files = [ "C:/Users/ADMIN/.aws/credentials" ]
  profile = "default"
  region = var.region
}

provider "http" {}