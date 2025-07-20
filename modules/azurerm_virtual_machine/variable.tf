variable "virtual_machines" {
  description = "Map of virtual machines to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string

    caching                       = string
    storage_account_type          = string
    virtual_network_name          = string
    subnet_name                   = string
    public_ip_name                = optional(string, null)
    key_vault_name                = optional(string, null)
    key_vault_secret_name         = optional(string, null)
    key_vault_secret_pass         = optional(string, null)
    key_vault_secret_user         = optional(string, null)
    private_ip_address_allocation = optional(string, "Dynamic")
    publisher                     = string
    offer                         = string
    sku                           = string
    version                       = string
  }))
}

