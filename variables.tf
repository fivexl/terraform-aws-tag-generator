variable "prefix" {
  type    = string
  default = "default"
  validation {
    condition     = !contains(["aws", "lambda-console", "elasticbeanstalk"], var.prefix)
    error_message = "Impossible to use `aws`,`lambda-console`,`elasticbeanstalk` here."
  }
}

variable "separator" {
  type    = string
  default = ":"
  validation {
    condition     = !contains(["-"], var.separator)
    error_message = "Impossible to use `-` here."
  }
}

variable "git_other" {
  type    = string
  default = null
}

variable "terraform_managed" {
  type    = string
  default = null
}

variable "terraform_state" {
  type    = string
  default = null
}

variable "terraform_other" {
  type    = string
  default = null
}

variable "data_pii" {
  type    = string
  default = null
}

variable "data_phi" {
  type    = string
  default = null
}

variable "data_pci" {
  type    = string
  default = null
}

variable "data_owner" {
  type    = string
  default = null
}

variable "data_classification" {
  type    = string
  default = null
}

variable "data_other" {
  type    = string
  default = null
}

variable "environment_name" {
  type    = string
  default = null
}

variable "environment_type" {
  type    = string
  default = null
}

variable "environment_other" {
  type    = string
  default = null
}

variable "gc_enable" {
  type    = string
  default = null
}

variable "gc_ttl" {
  type    = string
  default = null
}

variable "gc_other" {
  type    = string
  default = null
}

variable "custom_prefix" {
  type    = string
  default = "custom"
}

variable "custom_strings" {
  type    = map(string)
  default = {}
}

variable "custom_numbers" {
  type    = map(number)
  default = {}
}