variable "key_vaults" {
  description = "Map of key vaults to create"
  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    sku_name                   = string
    
    soft_delete_enabled        = optional(bool, true)
    soft_delete_retention_days = number
    purge_protection_enabled   = optional(bool, false)
    enable_rbac_authorization  = bool
  }))

}
