[![FivexL](https://releases.fivexl.io/fivexlbannergit.jpg)](https://fivexl.io/)

# AWS Tag Generator Terraform module
Simple tag generator for AWS resources based on FivexL expirience and [best practices from AWS](https://d1.awsstatic.com/whitepapers/aws-tagging-best-practices.pdf)  

## Known AWS tags
- ECS Capacity Provider add `AmazonECSManaged=1` tag to ASG

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| external | >= 2.0 |
| bash | - |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| prefix | main prefix for tags, which could be your organization name or project name | `string` | `"default"` | no |
| separator | separator for tags, e.g. (`default:custom:mytag`) | `string` | `":"` | no |
| git_other | pre templated tag `default:git:other`. Other for Git  | `string` | `null` | no |
| terraform_managed | pre templated tag `default:terraform:managed`. Tag resources witch managed by Terraform  | `string` | `null` | no |
| terraform_state | pre templated tag `default:terraform:state`. Terraform state file location and key name  | `string` | `null` | no |
| terraform_other | pre templated tag `default:terraform:other`. Other for Terraform  | `string` | `null` | no |
| data_pii | pre templated tag `default:data:pii`. Resource contains PII data  | `string` | `null` | no |
| data_phi | pre templated tag `default:data:phi`. Resource contains PHI data  | `string` | `null` | no |
| data_pci | pre templated tag `default:data:pci`. Resource contains PCI data  | `string` | `null` | no |
| data_owner | pre templated tag `default:data:owner`. Data Owner  | `string` | `null` | no |
| data_classification | pre templated tag `default:data:classification`. Data classification (restricted/confidential)  | `string` | `null` | no |
| data_other | pre templated tag `default:data:other`. Other for Data  | `string` | `null` | no |
| environment_name | pre templated tag `default:environment:name`. Environment name (production/staging/test)  | `string` | `null` | no |
| environment_type | pre templated tag `default:environment:type`. Environment type (shared/performance testing)  | `string` | `null` | no |
| environment_other | pre templated tag `default:environment:other`. Other for Environment | `string` | `null` | no |
| gc_enable | pre templated tag `default:garbage-collector:enable`. Enable Garbage Collector for this resource  | `string` | `null` | no |
| gc_ttl | pre templated tag `default:garbage-collector:time-to-live`. Time to Live for Garbage Collector. Days.  | `string` | `null` | no |
| gc_other | pre templated tag `default:garbage-collector:other`. Other for Garbage Collector  | `string` | `null` | no |
| custom_prefix | secondary level prefix for custom tags, which could be added by `custom_strings` and `custom_numbers` | `string` | `"custom"` | no |
| custom_strings | custom tags, which must be strings. e.g. (`default:custom:mystring = "mystring"`) | `map(string)` | `{}` | no |
| custom_numbers | custom tags, which must be strings. e.g. (`default:custom:mynumber = 5000`)  | `map(number)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| result | result with tags `object{}` |
| result_asg_list | result with list of tags for ASG `tuple[object{}]` `propagate_at_launch=true` |
| result_asg_list_false | result with list of tags for ASG `tuple[object{}]` `propagate_at_launch=false` |


## License

Apache 2 Licensed. See LICENSE for full details.
