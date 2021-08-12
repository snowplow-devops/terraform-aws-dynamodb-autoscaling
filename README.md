[![Release][release-image]][release] [![CI][ci-image]][ci] [![License][license-image]][license] [![Registry][registry-image]][registry]

# terraform-aws-dynamodb-autoscaling

A Terraform module for enabling auto-scaling for a target DynamoDB table.

_Note_: It's important you ignore changes to "READ" and "WRITE" units on your source DynamoDB table resource to prevent Terraform removing the scaling actions.

## Usage

To enable auto-scaling on a table simply create the table resource and apply the auto-scaling module to the output table - ensuring that you ignore write & read capacity settings!

```hcl
resource "aws_dynamodb_table" "snowplow_kcl_table" {
  name           = "my-table-name"
  hash_key       = "leaseKey"
  write_capacity = 1
  read_capacity  = 1

  attribute {
    name = "leaseKey"
    type = "S"
  }

  lifecycle {
    ignore_changes = [write_capacity, read_capacity]
  }
}

module "table_autoscaling" {
  source  = "snowplow-devops/dynamodb-autoscaling/aws"

  table_name = aws_dynamodb_table.snowplow_kcl_table.id
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.read_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.read_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_target.write_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_read_max_capacity"></a> [read\_max\_capacity](#input\_read\_max\_capacity) | The maximum READ capacity for the table | `number` | `50` | no |
| <a name="input_read_min_capacity"></a> [read\_min\_capacity](#input\_read\_min\_capacity) | The minimum READ capacity for the table | `number` | `1` | no |
| <a name="input_read_scale_in_cooldown"></a> [read\_scale\_in\_cooldown](#input\_read\_scale\_in\_cooldown) | The number of seconds before scaling IN can occur after a scaling action | `number` | `300` | no |
| <a name="input_read_scale_out_cooldown"></a> [read\_scale\_out\_cooldown](#input\_read\_scale\_out\_cooldown) | The number of seconds before scaling OUT can occur after a scaling action | `number` | `30` | no |
| <a name="input_read_target_value"></a> [read\_target\_value](#input\_read\_target\_value) | The target utilization percentage for the table | `number` | `85` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | The name of the DynamoDB table to add auto-scaling to | `string` | n/a | yes |
| <a name="input_write_max_capacity"></a> [write\_max\_capacity](#input\_write\_max\_capacity) | The maximum WRITE capacity for the table | `number` | `50` | no |
| <a name="input_write_min_capacity"></a> [write\_min\_capacity](#input\_write\_min\_capacity) | The minimum WRITE capacity for the table | `number` | `1` | no |
| <a name="input_write_scale_in_cooldown"></a> [write\_scale\_in\_cooldown](#input\_write\_scale\_in\_cooldown) | The number of seconds before scaling IN can occur after a scaling action | `number` | `300` | no |
| <a name="input_write_scale_out_cooldown"></a> [write\_scale\_out\_cooldown](#input\_write\_scale\_out\_cooldown) | The number of seconds before scaling OUT can occur after a scaling action | `number` | `30` | no |
| <a name="input_write_target_value"></a> [write\_target\_value](#input\_write\_target\_value) | The target utilization percentage for the table | `number` | `85` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_read_policy_arn"></a> [read\_policy\_arn](#output\_read\_policy\_arn) | ARN of the read policy |
| <a name="output_write_policy_arn"></a> [write\_policy\_arn](#output\_write\_policy\_arn) | ARN of the write policy |

# Copyright and license

The Terraform AWS DynamoDB AutoScaling project is Copyright 2021-2021 Snowplow Analytics Ltd.

Licensed under the [Apache License, Version 2.0][license] (the "License");
you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[release]: https://github.com/snowplow-devops/terraform-aws-dynamodb-autoscaling/releases/latest
[release-image]: https://img.shields.io/github/v/release/snowplow-devops/terraform-aws-dynamodb-autoscaling

[ci]: https://github.com/snowplow-devops/terraform-aws-dynamodb-autoscaling/actions?query=workflow%3Aci
[ci-image]: https://github.com/snowplow-devops/terraform-aws-dynamodb-autoscaling/workflows/ci/badge.svg

[license]: https://www.apache.org/licenses/LICENSE-2.0
[license-image]: https://img.shields.io/badge/license-Apache--2-blue.svg?style=flat

[registry]: https://registry.terraform.io/modules/snowplow-devops/dynamodb-autoscaling/aws/latest
[registry-image]: https://img.shields.io/static/v1?label=Terraform&message=Registry&color=7B42BC&logo=terraform
