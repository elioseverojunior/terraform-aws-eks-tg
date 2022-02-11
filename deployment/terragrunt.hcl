remote_state {
  backend = "s3"

  config = {
    encrypt = true
    bucket  = "pd-sre-infrastructure"
    key     = "${path_relative_to_include()}/terraform.tfstate"
    region  = "us-east-2"
  }
}

inputs = {
  tags = {
    "pd:ansible"          = "false"
    "pd:deployer"         = "elio.severo@passeidireto.com"
    "pd:iac"              = "terraform"
    "pd:owner"            = "TBD"
    "pd:project"          = "Terraform AWS EKS"
    "pd:region"           = "TBD"
    "pd:repo"             = "https://github.com/PasseiDireto/terraform-aws-eks"
    "pd:stack"            = "TBD"
    "pd:tier"             = "infra"
    "propagate_at_launch" = true
    "deployed_at"         = timestamp()
  }
}
