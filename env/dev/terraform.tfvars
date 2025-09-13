name            = "demo-devrg"             # prefix for RG/VNet/Subnet names
location        = "westus3"
subscription_id = "81bc6c91-ee7a-4e28-8c45-0cea109ab7f4"
tenant_id       = "a71b952d-22de-4a3b-ace4-460b36215ed6"


# Addressing (make sure subnet is inside the VNet CIDR)
vnet_cidr   = "10.10.0.0/16"
subnet_cidr = "10.10.2.0/24"
subnet_cidr2 = "10.10.3.0/24"
tags = {
  env       = "dev"
  managedBy = "terraform"
}

