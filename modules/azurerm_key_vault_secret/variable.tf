variable "key_vault_secrets" {
  description = "Map of key vault secrets to create"
  type = map(object({
    name                = string
    value               = string
    content_type        = optional(string, null)
    tags                = optional(map(string), null)
    key_vault_name      = string
    resource_group_name = string
  }))
}
