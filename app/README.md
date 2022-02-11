# EKS

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.73 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.73 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_subnet.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.all_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.all_private_by_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet_ids.all](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.all_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.all_private_by_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_subnet_ids.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.vpc_info](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_cidr_blocks"></a> [access\_cidr\_blocks](#input\_access\_cidr\_blocks) | Access CIDR Blocks | `list(string)` | `[]` | no |
| <a name="input_additional_whitelist_cidr_blocks"></a> [additional\_whitelist\_cidr\_blocks](#input\_additional\_whitelist\_cidr\_blocks) | description | `list(string)` | `[]` | no |
| <a name="input_all_private_subnet_tag_filter"></a> [all\_private\_subnet\_tag\_filter](#input\_all\_private\_subnet\_tag\_filter) | Tag to be filter in subnets | `map(any)` | <pre>{<br>  "Name": "*private*"<br>}</pre> | no |
| <a name="input_allowed_sgs"></a> [allowed\_sgs](#input\_allowed\_sgs) | Allowed Security Groups | `list(string)` | `[]` | no |
| <a name="input_application"></a> [application](#input\_application) | The Application Name. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Name. | `string` | n/a | yes |
| <a name="input_cidr_block_filter"></a> [cidr\_block\_filter](#input\_cidr\_block\_filter) | Used To filter CIDR's Blocks | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster Name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The Environment Name. | `string` | n/a | yes |
| <a name="input_environment_short"></a> [environment\_short](#input\_environment\_short) | Environment Short Name | `string` | n/a | yes |
| <a name="input_lambda_cidr_block_filter"></a> [lambda\_cidr\_block\_filter](#input\_lambda\_cidr\_block\_filter) | Used To filter CIDR's Blocks | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_lambda_subnet_tag_filter"></a> [lambda\_subnet\_tag\_filter](#input\_lambda\_subnet\_tag\_filter) | Tag to be filter in subnets | `map(any)` | <pre>{<br>  "Name": "*private*",<br>  "lambda": "yes"<br>}</pre> | no |
| <a name="input_public_subnet_tag_filter"></a> [public\_subnet\_tag\_filter](#input\_public\_subnet\_tag\_filter) | Tag to be filter in subnets | `map(any)` | <pre>{<br>  "Name": "*public*"<br>}</pre> | no |
| <a name="input_remote_state"></a> [remote\_state](#input\_remote\_state) | Remote State Config | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS Tags | `map(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_private_subnet_ids"></a> [all\_private\_subnet\_ids](#output\_all\_private\_subnet\_ids) | All Private AWS Subnet Ids |
| <a name="output_all_private_subnet_ids_by_filter"></a> [all\_private\_subnet\_ids\_by\_filter](#output\_all\_private\_subnet\_ids\_by\_filter) | AWS Subnet Ids all\_private\_by\_filter |
| <a name="output_all_private_subnets_cidr_blocks"></a> [all\_private\_subnets\_cidr\_blocks](#output\_all\_private\_subnets\_cidr\_blocks) | n/a |
| <a name="output_all_private_subnets_cidr_blocks_by_filter"></a> [all\_private\_subnets\_cidr\_blocks\_by\_filter](#output\_all\_private\_subnets\_cidr\_blocks\_by\_filter) | n/a |
| <a name="output_all_subnet_ids"></a> [all\_subnet\_ids](#output\_all\_subnet\_ids) | AWS Subnet Ids |
| <a name="output_all_subnets_cidr_blocks"></a> [all\_subnets\_cidr\_blocks](#output\_all\_subnets\_cidr\_blocks) | All Subnet CIDR Blocks |
| <a name="output_cidr_blocks"></a> [cidr\_blocks](#output\_cidr\_blocks) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | All Public AWS Subnet Ids |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | n/a |
| <a name="output_remote_state"></a> [remote\_state](#output\_remote\_state) | The ID of the Function's IAM Role. |
| <a name="output_security_groups"></a> [security\_groups](#output\_security\_groups) | n/a |
| <a name="output_total_all_private_subnet_ids"></a> [total\_all\_private\_subnet\_ids](#output\_total\_all\_private\_subnet\_ids) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
