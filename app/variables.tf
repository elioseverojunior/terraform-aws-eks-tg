/*
    Required Variables
*/
variable "aws_region" {
  description = "AWS Region Name."
  type        = string
}

variable "environment" {
  description = "The Environment Name."
  type        = string
}

variable "environment_short" {
  description = "Environment Short Name"
  type        = string
}

variable "application" {
  description = "The Application Name."
  type        = string
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
}

variable "remote_state" {
  description = "Remote State Config"
  type        = string
}

/*
    VPC Info Variables
*/
variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

variable "public_subnet_tag_filter" {
  description = "Tag to be filter in subnets"
  type        = map(any)

  default = {
    Name = "*public*"
  }
}

variable "all_private_subnet_tag_filter" {
  description = "Tag to be filter in subnets"
  type        = map(any)

  default = {
    Name = "*private*"
  }
}

variable "lambda_subnet_tag_filter" {
  description = "Tag to be filter in subnets"
  type        = map(any)
  default = {
    Name   = "*private*"
    lambda = "yes"
  }
}

variable "lambda_cidr_block_filter" {
  description = "Used To filter CIDR's Blocks"
  type        = list(string)
  default     = ["*"]
}

variable "cidr_block_filter" {
  description = "Used To filter CIDR's Blocks"
  type        = list(string)
  default     = ["*"]
}

variable "allowed_sgs" {
  description = "Allowed Security Groups"
  type        = list(string)
  default     = []
}

variable "access_cidr_blocks" {
  description = "Access CIDR Blocks"
  type        = list(string)
  default     = []
}

variable "additional_whitelist_cidr_blocks" {
  description = "description"
  type        = list(string)
  default     = []
}

/*
    Tags
*/
variable "default_tags" {
  description = "AWS Tags Standards"
  type        = map(any)
}

variable "tags" {
  description = "AWS Tags Standards"
  type        = map(any)
}

variable "tags_eks" {
  description = "AWS Tags Standards"
  type        = map(any)
}

variable "tags_shared" {
  description = "AWS Tags Standards"
  type        = map(any)
}


variable "tags_vpc" {
  description = "AWS Tags Standards"
  type        = map(any)
}

variable "private_subnet_tags" {
  description = "AWS Tags Standards"
  type        = map(any)
}

/*
    NLB and ALB Variables
*/
variable "nlb_ingress_internal" {
  type    = bool
  default = false
}

variable "nlb_ingress_type" {
  type    = string
  default = "network"
}

variable "proxy_protocol_v2" {
  type    = bool
  default = false
}

variable "nlb_ingress_enable_termination_protection" {
  type    = bool
  default = false
}

variable "enable_cross_zone_load_balancing" {
  type    = bool
  default = true
}

variable "cluster_private_zone" {
  type    = string
  default = "sandbox.passeidireto.com"
}

variable "kiali_virtual_service_host" {
  type    = string
  default = "kiali.sandbox.passeidireto.com"
}

variable "grafana_kiali_virtual_service_host" {
  type    = string
  default = "grafana.sandbox.passeidireto.com"
}

/*
    EKS Cluster Variables
*/
variable "eks_cluster_version" {
  description = "AWS EC2 Instance Type"
  type        = string
  default     = "1.21"
}

variable "eks_worker_groups_instance_type" {
  description = "AWS EC2 Instance Type"
  type        = string
  default     = "t3a.medium"
}

variable "eks_worker_groups_asg_max_size" {
  description = "AWS EC2 ASG Maximum Size"
  type        = number
  default     = 1
}

/*
    Additional Variables
*/

