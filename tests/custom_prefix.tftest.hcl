variables {
  prefix         = "acme"
  custom_strings = { "Team" = "platform" }
}

run "default_custom_prefix" {
  command = plan

  assert {
    condition     = jsonencode(output.result_map["custom"]) == jsonencode({ "acme:custom:team" = "platform" })
    error_message = "custom tags must be prefixed with <prefix>:<custom_prefix>:"
  }
}

run "empty_custom_prefix_keeps_keys_as_is" {
  command = plan

  variables {
    custom_prefix  = ""
    custom_strings = { "aws-apn-id-111111111111" = "pc:abc123" }
  }

  assert {
    condition     = jsonencode(output.result_map["custom"]) == jsonencode({ "aws-apn-id-111111111111" = "pc:abc123" })
    error_message = "empty custom_prefix must emit custom tags without any prefix"
  }
}
