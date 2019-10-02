variable "name" {
    description = "Name of the resource being created"
}
variable "location" {
    description = "location of the resource being created"
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
    type = "list"
}

variable "subnet_address_prefixes" {
    description = ""
    type = "list"
}