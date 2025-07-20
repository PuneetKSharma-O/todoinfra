data "azurerm_public_ip" "pip_name" {
  for_each            = var.virtual_machines
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "subnet_name" {
  for_each             = var.virtual_machines
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_key_vault" "keyvaults" {
  for_each            = var.virtual_machines
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name

}
data "azurerm_key_vault_secret" "key_vault_secrets" {
  for_each     = var.virtual_machines
  name         = each.value.key_vault_secret_name
  key_vault_id = data.azurerm_key_vault.keyvaults[each.key].id
}
data "azurerm_key_vault_secret" "key_vault_secretspassword" {
  for_each     = var.virtual_machines
  name         = each.value.key_vault_secret_pass
  key_vault_id = data.azurerm_key_vault.keyvaults[each.key].id
}
