data "aws_vpc" "vpc_info" {
  state = "available"
  id    = var.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.vpc_info.id
}

data "aws_subnet" "all" {
  for_each = data.aws_subnet_ids.all.ids
  id       = each.value
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.vpc_info.id
  tags   = var.public_subnet_tag_filter
}

data "aws_subnet" "public" {
  for_each = data.aws_subnet_ids.public.ids
  id       = each.value
}

data "aws_subnet_ids" "all_private" {
  vpc_id = data.aws_vpc.vpc_info.id
  tags   = var.all_private_subnet_tag_filter
}

data "aws_subnet" "all_private" {
  for_each = data.aws_subnet_ids.all_private.ids
  id       = each.value
}

data "aws_subnet_ids" "all_private_by_filter" {
  vpc_id = data.aws_vpc.vpc_info.id
  tags   = var.all_private_subnet_tag_filter

  filter {
    name   = "cidr-block"
    values = var.cidr_block_filter
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc_info.id]
  }
}

data "aws_subnet" "all_private_by_filter" {
  for_each = data.aws_subnet_ids.all_private_by_filter.ids
  id       = each.value
}
