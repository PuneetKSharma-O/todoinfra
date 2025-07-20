resource_groups = {
  rg1 = {
    name     = "rg1-todoapp"
    location = "Central India"
  }
  rg2 = {
    name     = "rg2-todoapp"
    location = "Central India"
  }
  rg3 = {
    name     = "rg3-todoapp"
    location = "Central India"
  }
}
storage_accounts = {
  sa1 = {
    name                     = "sa1todoapp"
    resource_group_name      = "rg1-todoapp"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
virtual_networks = {
  vnet1 = {
    name                = "vnet1-todoapp"
    resource_group_name = "rg1-todoapp"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "subnet1-todoapp"
    resource_group_name  = "rg1-todoapp"
    virtual_network_name = "vnet1-todoapp"
    address_prefixes     = ["10.0.1.0/24"]

  }
  subnet2 = {
    name                 = "subnet2-todoapp"
    resource_group_name  = "rg1-todoapp"
    virtual_network_name = "vnet1-todoapp"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
public_ips = {
  pip1 = {
    name                = "pip1-todoapp"
    resource_group_name = "rg1-todoapp"
    location            = "Central India"
    allocation_method   = "Static"
  }
}
virtual_machines = {
  vm1 = {
    name                          = "vm1-todoapp"
    resource_group_name           = "rg1-todoapp"
    location                      = "Central India"
    size                          = "Standard_B1s"
    publisher                     = "Canonical"
    offer                         = "0001-com-ubuntu-server-jammy"
    sku                           = "22_04-lts"
    version                       = "latest"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    subnet_name                   = "subnet1-todoapp"
    private_ip_address_allocation = "Dynamic"
    public_ip_name                = "pip1-todoapp"
    virtual_network_name          = "vnet1-todoapp"
    public_ip_address_allocation  = "Static"
    key_vault_name                = "kv1-keyvault"
    key_vault_secret_name         = "vm-username"
    key_vault_secret_pass         = "vm-password"


  }
}
mssql_servers = {
  mssql1 = {
    name                         = "mssql1-todoapp"
    resource_group_name          = "rg1-todoapp"
    location                     = "Central India"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "admin@123@@@"
  }
}
mssql_dbs = {
  mssql_db1 = {
    name                = "mssql_db1-todoapp"
    server_name         = "mssql1-todoapp"
    resource_group_name = "rg1-todoapp"
  }
}
key_vaults = {
  kv1 = {
    name                        = "kv1-keyvault"
    resource_group_name         = "rg1-todoapp"
    location                    = "Central India"
    sku_name                    = "standard"
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    enabled_for_disk_encryption = true
    enable_rbac_authorization   = true
  }
}
key_vault_secrets = {
  secret1 = {
    name                = "vm-username"
    value               = "adminuser"
    key_vault_name      = "kv1-keyvault"
    resource_group_name = "rg1-todoapp"
  }
  secret2 = {
    name                = "vm-password"
    value               = "admin@123@@@"
    key_vault_name      = "kv1-keyvault"
    resource_group_name = "rg1-todoapp"
  }
}
