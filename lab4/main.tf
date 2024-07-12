data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  myip = format("%s/32", chomp(data.http.myip.response_body))
}

# Module key_pair
module "key_pair" {
  source = "./modules/key_pair"
  key_path = var.key_path
}

module "secutiry_group" {
  source = "./modules/secutiry"
  allow_ssh_ip = local.myip
}

module "compute" {
  source = "./modules/compute"
  ami = var.ami_ids[var.region]
  instance_type = var.instance_type
  key_name = module.key_pair.key_pair_name
  security_group_id = module.secutiry_group.security_group_id
  user_data_path = var.user_data_path
}