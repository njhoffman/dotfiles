module "eks" {
    source = "./modules/eks"
  providers = {
    aws = aws.use2
  }

  aws_account = var.aws_account
  aws_profile = var.aws_profile
  aws_subnets = local.aws_subnet_ids
  aws_vpc     = local.aws_vpc_id
  identity    = local.identity
  //  rds_names = ["spadash-dev-rds"]
  tags = local.tags

  node_groups = {
    ng0 = {
      desired_capacity = 1
      instance_type    = "t3.large"
      max_capacity     = 1
      min_capacity     = 1
    }
  }
}

output "eks" {
  description = "EKS module outputs"
  value       = module.eks
}
