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



#calling nsg module
module "network" {
  source   = "./network"
  name     = var.name
  location = var.location
  subnet_cidr = var.subnet_cidr
  subnet_cidr2 = var.subnet_cidr2
  vnet_cidr = var.vnet_cidr
  tags     = var.tags
}

#calling vm module
module "vmmodule" {
  source           = "./vmmodule"
  name             = var.name
  location         = var.location
  vmname           = var.vmname
  admin_username   = var.admin_username
  admin_password   = var.admin_password
  nic_id           = module.network.nic_id
  vnet_name        = module.network.vnet_name
}

/*output "rg_name"     { value = azurerm_resource_group.rg.name }
output "vnet_name"   { value = azurerm_virtual_network.vnet.name }
output "subnet_name" { value = azurerm_subnet.subnet.name }*/

