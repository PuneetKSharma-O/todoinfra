variable "mssql_servers" {
  description = "Map of MSSQL servers to create"
  type = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = optional(string, "12.0")
    administrator_login          = string
    administrator_login_password = string
    tags                         = optional(map(string), null)
  }))

}
