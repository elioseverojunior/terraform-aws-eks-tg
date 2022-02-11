/*
    Remote State
*/
output "remote_state" {
  description = "The ID of the Function's IAM Role."
  value       = jsondecode(var.remote_state)
}

/*
    Environment Outputs
*/
output "aws_region" {
  value = var.aws_region
}

output "cluster_name" {
  value = var.cluster_name
}

output "environment" {
  value = var.environment
}

output "environment_short" {
  value = var.environment_short
}

output "application" {
  value = var.application
}

/*
    AWS Tags Outputs
*/
output "default_tags" {
  value = var.default_tags
}

output "tags" {
  value = var.tags
}

output "tags_eks" {
  value = var.tags_eks
}

output "private_subnet_tags" {
  value = var.private_subnet_tags
}

output "tags_vpc" {
  value = var.tags_vpc
}

/*
    VPC Info Outputs
*/
output "vpc_id" {
  value = data.aws_vpc.vpc_info.id
}

output "all_subnet_ids" {
  description = "AWS Subnet Ids"
  value       = [for subnet in data.aws_subnet_ids.all.ids : subnet]
}

output "all_subnets_cidr_blocks" {
  description = "All Subnet CIDR Blocks"
  value       = [for subnet in data.aws_subnet.all : subnet.cidr_block]
}

output "public_subnet_ids" {
  description = "All Public AWS Subnet Ids"
  value       = [for subnet in data.aws_subnet_ids.public.ids : subnet]
}

output "public_subnets_cidr_blocks" {
  value = [for subnet in data.aws_subnet.public : subnet.cidr_block]
}

output "all_private_subnet_ids" {
  description = "All Private AWS Subnet Ids"
  value       = [for subnet in data.aws_subnet_ids.all_private.ids : subnet]
}

output "all_private_subnets_cidr_blocks" {
  value = [for subnet in data.aws_subnet.all_private : subnet.cidr_block]
}

output "all_private_subnet_ids_by_filter" {
  description = "AWS Subnet Ids all_private_by_filter"
  value       = [for subnet in sort(data.aws_subnet_ids.all_private_by_filter.ids) : subnet]
}

output "all_private_subnets_cidr_blocks_by_filter" {
  value = [for subnet in data.aws_subnet.all_private_by_filter : subnet.cidr_block]
}

output "total_all_private_subnet_ids" {
  value = length(data.aws_subnet_ids.all_private.ids)
}

output "cidr_blocks" {
  value = local.cidr_blocks
}

output "security_groups" {
  value = local.security_groups
}

/*
    LoadBalancers Outputs
*/
output "nlb" {
  value = aws_lb.ingress
}