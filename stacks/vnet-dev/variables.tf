variable "name"            { type = string }
variable "location"        { type = string }
variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }
variable "vnet_cidr"       { type = string }
variable "subnet_cidr"     { type = string }
variable "subnet_cidr2"     { type = string }
variable "admin_username" {}
variable "admin_password" {}
variable "nic_id" {}
variable "vmname" {type = string}  
variable "tags" {
  type    = map(string)
  default = {}
}

