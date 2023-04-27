output "result" {
  description = "result with tags `object{}`"
  value       = local.result
}

output "result_asg_list" {
  description = "result with list of tags for ASG `tuple[object{}]` `propagate_at_launch=true`"
  value       = local.result_asg
}

output "result_asg_list_false" {
  description = "result with list of tags for ASG `tuple[object{}]` `propagate_at_launch=false`"
  value       = local.result_asg_false
}

output "result_awscc" {
  description = "result with list of tags for AWS Cloud Control API terraform provider `tuple[object{key=key, value=value}]`"
  value       = local.result_awscc
}

## Custom results

output "result_data_environment" {
  description = "result with only data and environment tags. No more than 10 tags. Usefull for S3 Objects."
  value       = local.result_data_environment
}

output "result_custom" {
  description = "result with only custom tags."
  value       = local.custom_value
}
