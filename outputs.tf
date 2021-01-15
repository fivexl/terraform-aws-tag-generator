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