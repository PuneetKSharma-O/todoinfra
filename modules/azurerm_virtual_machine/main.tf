resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.virtual_machines
  name                            = each.value.name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.key_vault_secrets[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.key_vault_secretspassword[each.key].value
  network_interface_ids           = [azurerm_network_interface.nics[each.key].id]
  disable_password_authentication = false

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  os_disk {

    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type

  }

  custom_data = base64encode(<<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF
  )


}
resource "azurerm_network_interface" "nics" {
  for_each            = var.virtual_machines
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.name
    subnet_id                     = data.azurerm_subnet.subnet_name[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip_name[each.key].id
  }
}
