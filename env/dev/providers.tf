terraform {
  backend "azurerm" {
    resource_group_name  = "azdevops"
    storage_account_name = "tfsivaremotestate"
    container_name       = "tfstate"
    key                  = "dev/vnet.tfstate"

  }
}
