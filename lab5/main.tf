# Configure ip deployed
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

locals {
  myip = format("%s/32", chomp(data.http.myip.response_body))
}

# Configure network
module "networking" {
  source = "./modules/networking"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zones = var.availability_zone[var.region]
}

# Configure security_group
module "security_group" {
  source = "./modules/security"
  allow_ssh_ip = local.myip
  vpc_id = module.networking.vpc_id
}

# Configure key_pair
module "key_pair" {
  source = "./modules/key_pair"
  key_pair_path = var.key_path
}

# Configure compute
module "compute" {
  source = "./modules/compute"
  ami_id = var.ami_ids[var.region]
  instance_type = var.instance_type
  user_data_path = var.user_data_path
  key_name = module.key_pair.key_pair_name
  security_group_ids = [module.security_group.public_sg_id]
  subnet_id = module.networking.public_subnet_id[0]
}

