terraform {
  required_version = "= 0.11.7"
}

provider "azurerm" {
  version = "1.3.0"
}

variable "name" {
    default = "testtom"
}

variable "location" {
  default = "centralus"
}

// resource "azurerm_resource_group" "module" {
//   name     = "${var.name}-rg"
//   location = "${var.location}"
// }

module "test" {
    source = "../../terraform-azurerm-webserver/"
    location  = "${var.location}"
    name      = "develop"

    count    = 2
    username = "mytestadmin"
    password = "Pass@w0rd!"
}