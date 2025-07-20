data "azurerm_mssql_server" "servers" {
  for_each = var.mssql_dbs
  name                = each.value.server_name
  resource_group_name = each.value.resource_group_name
}