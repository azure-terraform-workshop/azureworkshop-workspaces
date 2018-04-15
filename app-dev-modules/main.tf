terraform {
  required_version = "= 0.11.7"
}

provider "azurerm" {
  version = "1.3.0"
}

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
  
  name                 = "${var.name}"
  location             = "${var.location}"
  vnet_address_spacing = "${var.vnet_address_spacing}"
  subnet_address_prefixes = "${var.subnet_address_prefixes}"
}

// module "webserver" {
//   source  = "app.terraform.io/cardinalsolutions/webserver/azurerm"
//   version = "0.0.1"

//   name      = "${var.name}"
//   location  = "${var.location}"
//   subnet_id = "${module.networking.subnet_ids[0]}"
//   count     = 2
//   username  = "${var.username}"
//   password  = "${var.password}"
// }

// module "appserver" {
//   source  = "app.terraform.io/cardinalsolutions/appserver/azurerm"
//   version = "0.0.1"

//   name      = "${var.name}"
//   location  = "${var.location}"
//   subnet_id = "${module.networking.subnet_ids[1]}"
//   count     = 1
//   username  = "${var.username}"
//   password  = "${var.password}"
// }

// module "dataserver" {
//   source  = "app.terraform.io/cardinalsolutions/dataserver/azurerm"
//   version = "0.0.1"

//   name      = "${var.name}"
//   location  = "${var.location}"
//   subnet_id = "${module.networking.subnet_ids[2]}"
//   count     = 1
//   username  = "${var.username}"
//   password  = "${var.password}"
// }

// output "networking_vnet" {
//   value = "${module.networking.vnet_id}"
// }

// output "networking_subnets" {
//   value = "${module.networking.subnet_ids}"
// }

// output "webserver_vms" {
//   value = "${module.webserver.vms_id}"
// }

// output "appserver_vms" {
//   value = "${module.appserver.vms_id}"
// }

// output "dataserver_vms" {
//   value = "${module.dataserver.vms_id}"
// }
