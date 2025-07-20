data "azurerm_key_vault" "keyvaults1" {
  for_each            = var.key_vault_secrets
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}
