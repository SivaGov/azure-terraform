variable "name"            { type = string }
variable "location"        { type = string }
variable "nic_id" {}
variable "admin_username" {}
variable "admin_password" {}
variable "vnet_name" {type = string}
variable "vmname" {type = string}
variable "tags" {
  type    = map(string)
  default = {}
}