variable "name"            { type = string }
variable "location"        { type = string }
variable "nic_id" {}
variable "admin_username" {}
variable "admin_password" {}
variable "tags" {
  type    = map(string)
  default = {}
}