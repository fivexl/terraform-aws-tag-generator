data "external" "git_origin_url" {
  program = ["bash", "${path.module}/scripts/exec2json.sh", "git config --get remote.origin.url"]
}

data "external" "git_module_source" {
  program = ["bash", "${path.module}/scripts/exec2json.sh", "git rev-parse --show-prefix"]
}

locals {
  main_prefix = lower(var.prefix)

  git_remote          = "${local.main_prefix}${var.separator}git${var.separator}remote"
  git_module          = "${local.main_prefix}${var.separator}git${var.separator}module"
  git_other           = "${local.main_prefix}${var.separator}git${var.separator}other"
  terraform_managed   = "${local.main_prefix}${var.separator}terraform${var.separator}managed"
  terraform_state     = "${local.main_prefix}${var.separator}terraform${var.separator}state"
  terraform_other     = "${local.main_prefix}${var.separator}terraform${var.separator}other"
  data_pii            = "${local.main_prefix}${var.separator}data${var.separator}pii"
  data_phi            = "${local.main_prefix}${var.separator}data${var.separator}phi"
  data_pci            = "${local.main_prefix}${var.separator}data${var.separator}pci"
  data_owner          = "${local.main_prefix}${var.separator}data${var.separator}owner"
  data_classification = "${local.main_prefix}${var.separator}data${var.separator}classification"
  data_other          = "${local.main_prefix}${var.separator}data${var.separator}other"
  environment_name    = "${local.main_prefix}${var.separator}environment${var.separator}name"
  environment_type    = "${local.main_prefix}${var.separator}environment${var.separator}type"
  environment_other   = "${local.main_prefix}${var.separator}environment${var.separator}other"
  gc_enable           = "${local.main_prefix}${var.separator}garbage-collector${var.separator}enable"
  gc_ttl              = "${local.main_prefix}${var.separator}garbage-collector${var.separator}time-to-live"
  gc_other            = "${local.main_prefix}${var.separator}garbage-collector${var.separator}other"

  git_origin_url    = trimprefix(trimprefix(trimsuffix(lower(data.external.git_origin_url.result["Result"]), ".git"), "git@github.com:"), "https://github.com/")
  git_module_source = lower(data.external.git_module_source.result["Result"])

  git_remote_value          = local.git_origin_url != "" ? { (local.git_remote) = local.git_origin_url } : {}
  git_module_value          = local.git_module_source != "" ? { (local.git_module) = local.git_module_source } : {}
  git_other_value           = var.git_other != "" ? { (local.git_other) = var.git_other } : {}
  terraform_managed_value   = var.terraform_managed != "" ? { (local.terraform_managed) = var.terraform_managed } : {}
  terraform_state_value     = var.terraform_state != "" ? { (local.terraform_state) = var.terraform_state } : {}
  terraform_other_value     = var.terraform_other != "" ? { (local.terraform_other) = var.terraform_other } : {}
  data_pii_value            = var.data_pii != "" ? { (local.data_pii) = var.data_pii } : {}
  data_phi_value            = var.data_phi != "" ? { (local.data_pii) = var.data_phi } : {}
  data_pci_value            = var.data_pci != "" ? { (local.data_pci) = var.data_pci } : {}
  data_owner_value          = var.data_owner != "" ? { (local.data_owner) = var.data_owner } : {}
  data_classification_value = var.data_classification != "" ? { (local.data_classification) = var.data_classification } : {}
  data_other_value          = var.data_other != "" ? { (local.data_other) = var.data_other } : {}
  environment_name_value    = var.environment_name != "" ? { (local.environment_name) = var.environment_name } : {}
  environment_type_value    = var.environment_type != "" ? { (local.environment_type) = var.environment_type } : {}
  environment_other_value   = var.environment_other != "" ? { (local.environment_other) = var.environment_other } : {}
  gc_enable_value           = var.gc_enable != "" ? { (local.gc_enable) = var.gc_enable } : {}
  gc_ttl_value              = var.gc_ttl != "" ? { (local.gc_ttl) = var.gc_ttl } : {}
  gc_other_value            = var.gc_other != "" ? { (local.gc_other) = var.gc_other } : {}

  custom_prefix = lower(var.custom_prefix)
  custom = merge(
    { for k, v in var.custom_strings : join(var.separator, [local.main_prefix, local.custom_prefix, lower(k)]) => v },
    { for k, v in var.custom_numbers : join(var.separator, [local.main_prefix, local.custom_prefix, lower(k)]) => v },
  )

  result = merge(
    local.git_remote_value,
    local.git_module_value,
    local.git_other_value,
    local.terraform_managed_value,
    local.terraform_state_value,
    local.terraform_other_value,
    local.data_pii_value,
    local.data_phi_value,
    local.data_pci_value,
    local.data_owner_value,
    local.data_classification_value,
    local.data_other_value,
    local.environment_name_value,
    local.environment_type_value,
    local.environment_other_value,
    local.gc_enable_value,
    local.gc_ttl_value,
    local.gc_other_value,
    local.custom,
  )

  result_asg       = [for k, v in local.result : { key = k, value = v, propagate_at_launch = true }]
  result_asg_false = [for k, v in local.result : { key = k, value = v, propagate_at_launch = false }]
}

