include "root" {
  path   = find_in_parent_folders()
  expose = true
}

include "region" {
  path   = find_in_parent_folders("region.hcl")
  expose = true
}

include "environment" {
  path   = find_in_parent_folders("environment.hcl")
  expose = true
}

include "team" {
  path   = find_in_parent_folders("team.hcl")
  expose = true
}

locals {
  cluster_name = "sharedtools"
  application  = format("%s-%s-%s", include.environment.inputs.environment_short, include.team.inputs.team, local.cluster_name)
  remote_state = merge(include.root.remote_state,
    {
      backend = include.root.remote_state.backend
      config = merge(
        include.root.remote_state.config,
        {
          bucket = include.environment.inputs.s3_remote_bucket,
          region = include.region.inputs.aws_region,
        },
      )
    }
  )
  tags = merge(include.root.inputs.tags,
    {
      "Name"      = format("%s-eks", local.application),
      "pd:owner"  = include.team.inputs.team
      "pd:region" = include.region.inputs.aws_region
      "pd:stack"  = "EKS",
      "pd:stack"  = include.environment.inputs.environment
    }
  )
  tags_eks = merge(local.tags,
    {
      Name                     = format("%s-eks", local.application)
      "karpenter.sh/discovery" = local.cluster_name,
    }
  )
  tags_vpc = merge(local.tags,
    {
      Name = format("%s-eks-vpc", local.application)
    }
  )
  private_subnet_tags = merge(local.tags_vpc,
    {
      "kubernetes.io/cluster/${local.cluster_name}" = "owned",
      "karpenter.sh/discovery"                      = local.cluster_name,
    }
  )
  tags_shared = merge(local.tags,
    {
      "kubernetes.io/cluster/${local.cluster_name}" = "shared",
    }
  )
  tf_version = "latest"
}

remote_state = local.remote_state

terraform {
  source = "../../../../..///app/"

  before_hook "tfenv_install" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]
    execute = ["tfenv", "install", local.tf_version]
  }

  before_hook "tfenv_use" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]
    execute = ["tfenv", "use", local.tf_version]
  }
}

inputs = {
  application         = local.application
  aws_region          = include.region.inputs.aws_region
  cluster_name        = local.cluster_name
  default_tags        = include.root.inputs.tags
  environment         = include.environment.inputs.environment
  private_subnet_tags = local.private_subnet_tags
  remote_state        = local.remote_state
  tags                = local.tags
  tags                = local.tags
  tags_eks            = local.tags_eks
  tags_shared         = local.tags_shared
  tags_vpc            = local.tags_vpc
  vpc_id              = include.environment.inputs.vpc_id
}
