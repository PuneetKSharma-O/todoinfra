module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}
module "storage_account" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
}
module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}
module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurerm_subnet"
  subnets    = var.subnets
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}
module "virtual_machine" {
  depends_on       = [module.key_vault, module.key_vault_secrets, module.resource_group, module.subnet, module.public_ip]
  source           = "../../modules/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines

}
module "mssql_server" {
  depends_on    = [module.resource_group]
  source        = "../../modules/azurerm_mssql_server"
  mssql_servers = var.mssql_servers
}
module "mssql_dbs" {
  depends_on = [module.mssql_server]
  source     = "../../modules/azurerm_mssql_database"
  mssql_dbs  = var.mssql_dbs
}
module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults

}
module "key_vault_secrets" {
  depends_on        = [module.key_vault]
  source            = "../../modules/azurerm_key_vault_secret"
  key_vault_secrets = var.key_vault_secrets

}
