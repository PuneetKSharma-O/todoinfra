variable "storage_accounts" {
  description = "Map of storage accounts to create"
  type = map(object({
    name                      = string
    resource_group_name       = string
    location                  = string
    account_tier              = optional(string, "Standard")
    account_replication_type  = optional(string, "LRS")
    access_tier               = optional(string, "Hot")
    tags                      = optional(map(string), null)
    enable_https_traffic_only = optional(bool, true)
    allow_blob_public_access  = optional(bool, false)
  }))
}
