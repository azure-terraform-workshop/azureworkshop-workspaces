resource "random_string" "password" {
  length  = 14
  special = true
}

resource "tfe_workspace" "app-dev-modules" {
  name              = "app-dev-modules"
  organization      = "${var.organization}"
  working_directory = "app-dev-modules"

  vcs_repo {
    identifier     = "${var.vsc_identifier}"
    oauth_token_id = "${var.vsc_token}"
  }
}

resource "tfe_variable" "app-dev-modules-name" {
  key          = "name"
  value        = "tfetest"
  category     = "terraform"
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-location" {
  key          = "location"
  value        = "eastus"
  category     = "terraform"
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-username" {
  key          = "username"
  value        = "mypoweradmin"
  category     = "terraform"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-password" {
  key          = "password"
  value        = "${random_string.password.result}"
  category     = "terraform"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-vnet" {
  key          = "vnet_address_spacing"
  value        = "[\"10.0.0.0/16\"]"
  category     = "terraform"
  hcl          = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-subnet" {
  key          = "subnet_address_prefixes"
  value        = "[\"10.0.0.0/24\",\"10.0.1.0/24\",\"10.0.2.0/24\",]"
  category     = "terraform"
  hcl          = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-subscriptionid" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = "${var.SUBSCRIPTION_ID}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-tenantid" {
  key          = "ARM_TENANT_ID"
  value        = "${var.TENANT_ID}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-clientid" {
  key          = "ARM_CLIENT_ID"
  value        = "${var.CLIENT_ID}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-clientsecret" {
  key          = "ARM_CLIENT_SECRET"
  value        = "${var.CLIENT_SECRET}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}

resource "tfe_variable" "app-dev-modules-destroy" {
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${tfe_workspace.app-dev-modules.id}"
}
