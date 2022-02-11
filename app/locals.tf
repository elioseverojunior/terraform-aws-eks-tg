locals {
  all_private_subnet_ids_by_filter = [for subnet in sort(data.aws_subnet_ids.all_private_by_filter.ids) : subnet]
  cidr_blocks = flatten([sort(distinct(concat(
    flatten([
      var.access_cidr_blocks,
      var.additional_whitelist_cidr_blocks,
      [for subnet in data.aws_subnet.all_private_by_filter : subnet.cidr_block]
    ])
  )))])
  security_groups = flatten([sort(distinct(concat(flatten([var.allowed_sgs]))))])
}