resource "azurerm_key_vault_secret" "kvs" {
    for_each = var.key_vault_secrets
  name         = each.value.name
  value        = each.value.value
  
  key_vault_id = data.azurerm_key_vault.keyvaults1[each.key].id
}
