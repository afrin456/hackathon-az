terraform {
  backend "s3" {
    bucket         = "tf-state-bucket-ms-999"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
   required_version = "1.5.9"
}

provider "aws" {
  region = "ap-south-1"
}

module "network" {
  source = "../../modules/network"
  env    = "dev"

  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["ap-south-1a", "ap-south-1b"]
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "ecr" {
  source = "../../modules/ecr"
  env    = "dev"
}

module "eks" {
  source = "../../modules/eks"
  env    = "dev"
  vpc_id         = module.network.vpc_id
 public_subnets = module.network.public_subnets
 private_subnets = module.network.private_subnets
}




# module "iam" {
#   source = "../../modules/iam"
#   env    = "dev"
# }

# module "alb" {
#   source         = "../../modules/alb"
#   env            = "dev"
#   vpc_id         = module.network.vpc_id
#   public_subnets = module.network.public_subnets
# }
