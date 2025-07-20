variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), null)
  }))
}
variable "storage_accounts" {
  description = "Map of storage accounts to create"
  type = map(object({
    name                    = string
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
variable "virtual_networks" {
  description = "Map of virtual networks to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    tags                = optional(map(string), null)
  }))
}
variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name                      = string
    resource_group_name       = string
    virtual_network_name      = string
    address_prefixes          = list(string)
    service_endpoints         = optional(list(string), [])
    network_security_group_id = optional(string, null)
    delegation = optional(object({
      name    = string
      service = string
      actions = list(string)
    }), null)
    tags = optional(map(string), null)
  }))
}
variable "public_ips" {
  description = "Map of public IPs to create"
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = optional(string, "Static")
    sku                 = optional(string, "Basic")
    tags                = optional(map(string), null)
  }))
}
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
variable "mssql_servers" {
  description = "Map of SQL servers to create"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string


  }))
}
variable "mssql_dbs" {
  description = "Map of SQL databases to create"
  type = map(object({
    name                = string
    resource_group_name = string

    server_name = string




  }))
}
variable "key_vaults" {
  description = "Map of Key Vaults to create"
  type = map(object({

    name                       = string
    resource_group_name        = string
    location                   = string
    
    sku_name                   = string
    soft_delete_retention_days = number
    enable_rbac_authorization  = bool
    access_policies = optional(list(object({
      tenant_id = string

      object_id = string
      permissions = object({
        secrets      = string
        keys         = string
        certificates = string
      })
    })), [])

  }))
}
variable "key_vault_secrets" {
  description = "Map of Key Vault secrets to create"
  type = map(object({
    name                = string
    key_vault_name      = string
    value               = string
    content_type        = optional(string, null)
    enabled             = optional(bool, true)
    expiration_date     = optional(string, null)
    not_before          = optional(string, null)
    tags                = optional(map(string), null)
    resource_group_name = string

  }))

}
