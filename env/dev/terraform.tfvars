name            = "demo-dev"             # prefix for RG/VNet/Subnet names
location        = "eastus"
subscription_id = "<YOUR_SUBSCRIPTION_ID>"
tenant_id       = "<YOUR_TENANT_ID>"

# Addressing (make sure subnet is inside the VNet CIDR)
vnet_cidr   = "10.10.0.0/16"
subnet_cidr = "10.10.1.0/24"

tags = {
  env       = "dev"
  managedBy = "terraform"
}

