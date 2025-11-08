module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.4.0"

  name = var.env
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  map_public_ip_on_launch = true
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = var.env
  }
}
