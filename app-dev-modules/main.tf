#====================================================================
#=================== NETWORKING =====================================
#====================================================================
module "networking" {
  source  = "app.terraform.io/cardinalsolutions/networking/azurerm"
  version = "0.12.0"

  name                    = "${var.name}"
  location                = "${var.location}"
  vnet_address_spacing    = "${var.vnet_address_spacing}"
  subnet_address_prefixes = "${var.subnet_address_prefixes}"
}
  
#====================================================================
#=================== WEB SERVER =====================================
#==================================================================== 
module "webserver" {
  source                  = "app.terraform.io/cardinalsolutions/webserver/azurerm"
  version                 = "0.12.0"

  name                    = "${var.name}"
  location                = "${var.location}"
  subnet_id               = "${module.networking.subnet-ids[0]}"
  vm_count                = 1
  size                    = "${var.vm_size}"
  username                = "${var.username}"
  password                = "${var.password}"
}

#====================================================================
#=================== APP SERVER =====================================
#====================================================================
module "appserver" {
  source                  = "app.terraform.io/cardinalsolutions/appserver/azurerm"
  version                 = "0.12.0"

  name                    = "${var.name}"
  location                = "${var.location}"
  subnet_id               = "${module.networking.subnet-ids[1]}"
  vm_count                = 1
  size                    = "${var.vm_size}"
  username                = "${var.username}"
  password                = "${var.password}"
}

#====================================================================
#=================== DATA SERVER ====================================
#====================================================================
module "dataserver" {
  source  = "app.terraform.io/cardinalsolutions/dataserver/azurerm"
  version = "0.12.0"

  name                    = "${var.name}"
  location                = "${var.location}"
  subnet_id               = "${module.networking.subnet-ids[2]}"
  vm_count                = 1
  size                    = "${var.vm_size}"
  username                = "${var.username}"
  password                = "${var.password}"
}
