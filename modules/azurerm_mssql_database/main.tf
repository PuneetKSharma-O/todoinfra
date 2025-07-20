resource "azurerm_mssql_database" "mssqldbs" {
  for_each = var.mssql_dbs

  name      = each.value.name
  server_id = data.azurerm_mssql_server.servers[each.key].id
}
