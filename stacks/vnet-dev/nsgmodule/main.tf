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

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.name}-subnet01"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr]
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.name}-nic"
  location            = var.location
  resource_group_name = "${var.name}-rg"
  tags                = var.tags

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm-pip.id
  }
}

output "nic_id" {
  value = azurerm_network_interface.vm_nic.id
}

resource "azurerm_public_ip" "vm-pip" {
  name                = "${var.name}-pip"
  location            = var.location
  resource_group_name = "${var.name}-rg"
  allocation_method   = "Dynamic"
  sku                 = "Basic"
  tags                = var.tags
}