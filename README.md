[![FivexL](https://releases.fivexl.io/fivexlbannergit.jpg)](https://fivexl.io/)

# AWS Tag Generator Terraform module
Simple tag generator for AWS resources based on FivexL expirience and [best practices from AWS](https://d1.awsstatic.com/whitepapers/aws-tagging-best-practices.pdf)  

## Known AWS tags
- ECS Capacity Provider add `AmazonECSManaged=1` tag to ASG

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_external"></a> [external](#requirement\_external) | >= 2.0 |
| bash | - |
| git | - |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [external_external.git_module_source](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |
| [external_external.git_origin_url](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_enable"></a> [backup\_enable](#input\_backup\_enable) | pre templated tag `default:backup:enable`. Enable Backup for this resource | `string` | `""` | no |
| <a name="input_backup_frequency"></a> [backup\_frequency](#input\_backup\_frequency) | pre templated tag `default:backup:frequency`. Backup frequency (daily/weekly/monthly) | `string` | `""` | no |
| <a name="input_backup_other"></a> [backup\_other](#input\_backup\_other) | pre templated tag `default:backup:other`. Other for Backup | `string` | `""` | no |
| <a name="input_custom_numbers"></a> [custom\_numbers](#input\_custom\_numbers) | custom tags, which must be strings. e.g. (`default:custom:mynumber = 5000`) | `map(number)` | `{}` | no |
| <a name="input_custom_prefix"></a> [custom\_prefix](#input\_custom\_prefix) | secondary level prefix for custom tags, which could be added by `custom_strings` and `custom_numbers` | `string` | `"custom"` | no |
| <a name="input_custom_strings"></a> [custom\_strings](#input\_custom\_strings) | custom tags, which must be strings. e.g. (`default:custom:mystring = "mystring"`) | `map(string)` | `{}` | no |
| <a name="input_data_classification"></a> [data\_classification](#input\_data\_classification) | pre templated tag `default:data:classification`. Data classification (restricted/confidential) | `string` | `""` | no |
| <a name="input_data_other"></a> [data\_other](#input\_data\_other) | pre templated tag `default:data:other`. Other for Data | `string` | `""` | no |
| <a name="input_data_owner"></a> [data\_owner](#input\_data\_owner) | pre templated tag `default:data:owner`. Data Owner | `string` | `""` | no |
| <a name="input_data_pci"></a> [data\_pci](#input\_data\_pci) | pre templated tag `default:data:pci`. Resource contains PCI data | `string` | `""` | no |
| <a name="input_data_phi"></a> [data\_phi](#input\_data\_phi) | pre templated tag `default:data:phi`. Resource contains PHI data | `string` | `""` | no |
| <a name="input_data_pii"></a> [data\_pii](#input\_data\_pii) | pre templated tag `default:data:pii`. Resource contains PII data | `string` | `""` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | pre templated tag `default:environment:name`. Environment name (production/staging/test) | `string` | `""` | no |
| <a name="input_environment_other"></a> [environment\_other](#input\_environment\_other) | pre templated tag `default:environment:other`. Other for Environment | `string` | `""` | no |
| <a name="input_environment_type"></a> [environment\_type](#input\_environment\_type) | pre templated tag `default:environment:type`. Environment type (shared/performance testing) | `string` | `""` | no |
| <a name="input_gc_enable"></a> [gc\_enable](#input\_gc\_enable) | pre templated tag `default:garbage-collector:enable`. Enable Garbage Collector for this resource | `string` | `""` | no |
| <a name="input_gc_other"></a> [gc\_other](#input\_gc\_other) | pre templated tag `default:garbage-collector:other`. Other for Garbage Collector | `string` | `""` | no |
| <a name="input_gc_ttl"></a> [gc\_ttl](#input\_gc\_ttl) | pre templated tag `default:garbage-collector:time-to-live`. Time to Live for Garbage Collector. Days. | `string` | `""` | no |
| <a name="input_git_other"></a> [git\_other](#input\_git\_other) | pre templated tag `default:git:other`. Other for Git | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | main prefix for tags, which could be your organization name or project name | `string` | `"default"` | no |
| <a name="input_separator"></a> [separator](#input\_separator) | separator for tags, e.g. (`default:custom:mytag`) | `string` | `":"` | no |
| <a name="input_terraform_managed"></a> [terraform\_managed](#input\_terraform\_managed) | pre templated tag `default:terraform:managed`. Tag resources witch managed by Terraform | `string` | `""` | no |
| <a name="input_terraform_other"></a> [terraform\_other](#input\_terraform\_other) | pre templated tag `default:terraform:other`. Other for Terraform | `string` | `""` | no |
| <a name="input_terraform_state"></a> [terraform\_state](#input\_terraform\_state) | pre templated tag `default:terraform:state`. Terraform state file location and key name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_result"></a> [result](#output\_result) | result with tags `object{}` |
| <a name="output_result_asg_list"></a> [result\_asg\_list](#output\_result\_asg\_list) | result with list of tags for ASG `tuple[object{}]` `propagate_at_launch=true` |
| <a name="output_result_asg_list_false"></a> [result\_asg\_list\_false](#output\_result\_asg\_list\_false) | result with list of tags for ASG `tuple[object{}]` `propagate_at_launch=false` |
| <a name="output_result_awscc"></a> [result\_awscc](#output\_result\_awscc) | result with list of tags for AWS Cloud Control API terraform provider `tuple[object{key=key, value=value}]` |
| <a name="output_result_data_environment"></a> [result\_data\_environment](#output\_result\_data\_environment) | result with only data and environment tags. No more than 10 tags. Usefull for S3 Objects. |
| <a name="output_result_map"></a> [result\_map](#output\_result\_map) | map of results with tags |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. See LICENSE for full details.
