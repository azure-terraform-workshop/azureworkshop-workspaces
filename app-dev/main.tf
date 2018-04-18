terraform {
  required_version = "= 0.11.7"
}

provider "azurerm" {
  version = "1.3.0"
}

variable "name" {}

variable "location" {
  default = "centralus"
}

resource "azurerm_resource_group" "module" {
  name     = "${var.name}-rg"
  location = "${var.location}"

  tags {
    owner = "me"
    environment = "dev"
  }
}
