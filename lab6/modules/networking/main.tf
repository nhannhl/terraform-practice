module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"

  name = "my-vpc"
  cidr = var.vpc_cidr
  azs = var.vpc_az
  private_subnets = var.private_subnet_cidr
  public_subnets = var.public_subnet_cidr

  enable_nat_gateway = true
  single_nat_gateway = true
  one_nat_gateway_per_az = false

  tags = {
    Name = "my-vpc"
  }
}