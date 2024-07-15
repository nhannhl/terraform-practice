module "networking" {
  source = "./modules/networking"

  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  vpc_az = var.vpc_az
}