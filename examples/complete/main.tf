module "tags" {
  source            = "../../"
  prefix            = "example"
  separator         = ":"
  terraform_managed = "1"
  terraform_state   = "./terraform.tfstate"
  data_pii          = "0"
  data_phi          = "0"
  data_pci          = "0"
  environment_name  = "test"
  gc_enable         = "1"
  gc_ttl            = "7"
  backup_enable     = "1"
  backup_other      = "Used Service: AWS Backup"
  custom_strings = {
    custom_tag_text = "Value"
  }
  custom_numbers = {
    custom_tag_number = 1
  }
}

output "result" {
  value = module.tags.result
}

output "result_map" {
  value = module.tags.result_map
}
