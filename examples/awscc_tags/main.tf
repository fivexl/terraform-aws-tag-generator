provider "awscc" {
  region = "us-east-1"
}

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
}

output "result" {
  value = module.tags.result_awscc
}
