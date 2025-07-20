variable "mssql_dbs" {
  description = "Map of MSSQL databases to create"
  type = map(object({
    name                = string
    collation           = optional(string, "SQL_Latin1_General_CP1_CI_AS")
    max_size_bytes      = optional(string, "26843545600") # 25 GB
    sku_name            = optional(string, "S0")
    zone_redundant      = optional(bool, false)
    read_scale          = optional(bool, false)
    sample_name         = optional(string, null)
    elastic_pool_id     = optional(string, null)
    tags                = optional(map(string), null)
    server_name         = string
    resource_group_name = string
  }))

}
