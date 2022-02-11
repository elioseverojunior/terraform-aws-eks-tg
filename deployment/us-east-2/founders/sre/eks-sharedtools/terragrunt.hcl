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
  tf_version   = "latest"
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
}

remote_state = local.remote_state

terraform {
  source = "../../../../..//app"

  before_hook "tfenv_install" {
    commands = ["init", "plan", "apply", "destroy", "validate"]
    execute  = ["tfenv", "install", local.tf_version]
  }

  before_hook "tfenv_use" {
    commands = ["init", "plan", "apply", "destroy", "validate"]
    execute  = ["tfenv", "use", local.tf_version]
  }
}

inputs = {
  aws_region   = include.region.inputs.aws_region
  environment  = include.environment.inputs.environment
  application  = format("%s-%s", include.team.inputs.team, local.cluster_name)
  cluster_name = local.cluster_name
  tags = merge(include.root.inputs.tags,
    {
      "pd:deployer" = "elio.severo@passeidireto.com"
      "pd:owner"    = "sre"
      "pd:region"   = include.region.inputs.aws_region
      "pd:stack"    = "production"
      "pd:tier"     = "infra"
    }
  )
  remote_state = local.remote_state
  vpc_id       = include.environment.inputs.vpc_id
}
