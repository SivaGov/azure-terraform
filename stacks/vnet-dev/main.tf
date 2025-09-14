terraform {
  required_version = "= 1.7.0"
    required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.40.0"
    }
  }
}

provider "azurerm" {
  features {}
  # Auth will come from env vars ARM_* set by the pipeline (or your local shell).
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

terraform {
  backend "azurerm" {}
}

# Resource group (dev only)
resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-rg"
  location = var.location
  tags     = var.tags
}

# VNet
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.vnet_cidr]
  tags                = var.tags
}

# Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.name}-subnet01"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${var.name}-subnet02"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_cidr2]
}

#calling nsg module
module "nsgmodule" {
  source   = "./nsgmodule"
  name     = var.name
  location = var.location
  tags     = var.tags
}

#calling vm module
module "vmmodule" {
  source         = "./vmmodule"
  name           = var.name
  location       = var.location
  admin_username = var.admin_username
  admin_password = var.admin_password
  nic_id         = var.nic_id
}

output "rg_name"     { value = azurerm_resource_group.rg.name }
output "vnet_name"   { value = azurerm_virtual_network.vnet.name }
output "subnet_name" { value = azurerm_subnet.subnet.name }

