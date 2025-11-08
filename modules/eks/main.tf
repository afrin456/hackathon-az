module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.8.0"

  name               = "my-cluster"
  kubernetes_version = "1.33"

  addons = {
    coredns                = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy             = {}
    vpc-cni                = {
      before_compute = true
    }
  }

  # Optional
  endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = var.vpc_id
  subnet_ids               = var.public_subnets
  control_plane_subnet_ids = var.public_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      #ami_type       = "ami-0c55b159cbfafe1f0"
      instance_types = ["t2.micro"]

      min_size     = 4
      max_size     = 10
      desired_size = 4
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
