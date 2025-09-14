resource "azurerm_linux_virtual_machine" "vm1" {
  name                = var.vmname
  resource_group_name = "${var.name}-rg"
  location            = var.location
  size                = "Standard_B1s"

  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [var.nic_id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

