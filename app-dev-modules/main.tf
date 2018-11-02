variable "name" {}
variable "location" {}
variable "username" {}
variable "password" {}

variable "vnet_address_spacing" {
  type = "list"
}

variable "subnet_address_prefixes" {
  type = "list"
}

module "networking" {
  source  = "app.terraform.io/cardinalsolutions/networking/azurerm"
  version = "0.0.1"

  name                    = "${var.name}"
  location                = "${var.location}"
  vnet_address_spacing    = "${var.vnet_address_spacing}"
  subnet_address_prefixes = "${var.subnet_address_prefixes}"
}

module "webserver" {
  source  = "app.terraform.io/cardinalsolutions/webserver/azurerm"
  version = "0.0.1"

  name      = "${var.name}"
  location  = "${var.location}"
  subnet_id = "${module.networking.subnet-ids[0]}"
  count     = 2
  username  = "${var.username}"
  password  = "${var.password}"
}

module "appserver" {
  source  = "app.terraform.io/cardinalsolutions/appserver/azurerm"
  version = "0.0.1"

  name      = "${var.name}"
  location  = "${var.location}"
  subnet_id = "${module.networking.subnet-ids[1]}"
  count     = 1
  username  = "${var.username}"
  password  = "${var.password}"
}

module "dataserver" {
  source  = "app.terraform.io/cardinalsolutions/dataserver/azurerm"
  version = "0.0.1"

  name      = "${var.name}"
  location  = "${var.location}"
  subnet_id = "${module.networking.subnet-ids[2]}"
  count     = 1
  username  = "${var.username}"
  password  = "${var.password}"
}

output "networking_vnet" {
  value = "${module.networking.virtualnetwork-ids}"
}

output "networking_subnets" {
  value = "${module.networking.subnet-ids}"
}

output "webserver-vm-ids" {
  value = "${module.webserver.vm-ids}"
}

output "webserver-private-ips" {
  value = "${module.webserver.private-ips}"
}

output "appserver-vm-ids" {
  value = "${module.appserver.vm-ids}"
}

output "appserver-private-ips" {
  value = "${module.appserver.private-ips}"
}

output "dataserver-vm-ids" {
  value = "${module.dataserver.vm-ids}"
}

output "dataserver-private-ips" {
  value = "${module.dataserver.private-ips}"
}
