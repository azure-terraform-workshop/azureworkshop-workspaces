variable "name" {
  description = "Name of the resource being created."
  # default = "dev-server-1"
}
variable "location" {
  description = ""
}
variable "username" {
  description = ""
}
variable "password" {
  description = ""
}
variable "vm_size" {
  description = ""
}

variable "vnet_address_spacing" {
  description = ""
  type        = "list"
}

variable "subnet_address_prefixes" {
  description = ""
  type        = "list"
}