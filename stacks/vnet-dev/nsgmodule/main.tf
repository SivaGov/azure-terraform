resource "azurerm_network_security_group" "test_nsg" {
  name                = "${var.name}-nsg"
  location            = var.location
  resource_group_name = "${var.name}-rg"
  tags                = var.tags

    security_rule {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
  
}