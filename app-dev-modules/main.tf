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

module "webserver" {
    source  = "app.terraform.io/cardinalsolutions/webserver/azurerm"
    version = "0.0.1"

    location  = "${var.location}"
    name      = "${var.name}"
    username = "${var.username}"
    password = "${var.password}"
}
