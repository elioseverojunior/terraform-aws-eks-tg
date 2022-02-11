module "eks" {
  source = "./modules/eks"

  cluster_version       = var.eks_cluster_version
  cluster_iam_role_name = var.application
  cluster_name          = var.cluster_name
  vpc_id                = var.vpc_id
  subnets               = local.all_private_subnet_ids_by_filter
  enable_irsa           = true

  # Only need one node to get Karpenter up and running
  worker_groups = [
    {
      instance_type = var.eks_worker_groups_instance_type
      asg_max_size  = var.eks_worker_groups_asg_max_size
    }
  ]

  tags = var.tags_eks
}
