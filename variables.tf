variable "prefix" {
  description = "main prefix for tags, which could be your organization name or project name"
  type        = string
  default     = "default"
  validation {
    condition     = !contains(["aws", "lambda-console", "elasticbeanstalk", "AWS"], var.prefix)
    error_message = "Impossible to use `aws`,`lambda-console`,`elasticbeanstalk`, `AWS` here."
  }
}

variable "separator" {
  description = "separator for tags, e.g. (`default:custom:mytag`)"
  type        = string
  default     = ":"
  validation {
    condition     = !contains(["-"], var.separator)
    error_message = "Impossible to use `-` here."
  }
}

variable "git_other" {
  description = "pre templated tag `default:git:other`. Other for Git"
  type        = string
  default     = ""
}

variable "terraform_managed" {
  description = "pre templated tag `default:terraform:managed`. Tag resources witch managed by Terraform"
  type        = string
  default     = ""
}

variable "terraform_state" {
  description = "pre templated tag `default:terraform:state`. Terraform state file location and key name"
  type        = string
  default     = ""
}

variable "terraform_other" {
  description = "pre templated tag `default:terraform:other`. Other for Terraform"
  type        = string
  default     = ""
}

variable "data_pii" {
  description = "pre templated tag `default:data:pii`. Resource contains PII data"
  type        = string
  default     = ""
}

variable "data_phi" {
  description = "pre templated tag `default:data:phi`. Resource contains PHI data"
  type        = string
  default     = ""
}

variable "data_pci" {
  description = "pre templated tag `default:data:pci`. Resource contains PCI data"
  type        = string
  default     = ""
}

variable "data_owner" {
  description = "pre templated tag `default:data:owner`. Data Owner"
  type        = string
  default     = ""
}

variable "data_classification" {
  description = "pre templated tag `default:data:classification`. Data classification (restricted/confidential)"
  type        = string
  default     = ""
}

variable "data_other" {
  description = "pre templated tag `default:data:other`. Other for Data"
  type        = string
  default     = ""
}

variable "environment_name" {
  description = "pre templated tag `default:environment:name`. Environment name (production/staging/test)"
  type        = string
  default     = ""
}

variable "environment_type" {
  description = "pre templated tag `default:environment:type`. Environment type (shared/performance testing)"
  type        = string
  default     = ""
}

variable "environment_other" {
  description = "pre templated tag `default:environment:other`. Other for Environment"
  type        = string
  default     = ""
}

variable "gc_enable" {
  description = "pre templated tag `default:garbage-collector:enable`. Enable Garbage Collector for this resource"
  type        = string
  default     = ""
}

variable "gc_ttl" {
  description = "pre templated tag `default:garbage-collector:time-to-live`. Time to Live for Garbage Collector. Days."
  type        = string
  default     = ""
}

variable "gc_other" {
  description = "pre templated tag `default:garbage-collector:other`. Other for Garbage Collector"
  type        = string
  default     = ""
}

variable "custom_prefix" {
  description = "secondary level prefix for custom tags, which could be added by `custom_strings` and `custom_numbers`"
  type        = string
  default     = "custom"
}

variable "custom_strings" {
  description = "custom tags, which must be strings. e.g. (`default:custom:mystring = \"mystring\"`)"
  type        = map(string)
  default     = {}
}

variable "custom_numbers" {
  description = "custom tags, which must be strings. e.g. (`default:custom:mynumber = 5000`)"
  type        = map(number)
  default     = {}
}