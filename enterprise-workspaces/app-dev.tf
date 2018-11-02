resource "tfe_workspace" "app-dev" {
  name              = "app-dev"
  organization      = "${var.organization}"
  working_directory = "app-dev"

  vcs_repo {
    identifier     = "${var.vsc_identifier}"
    oauth_token_id = "${var.vsc_token}"
  }
}

resource "tfe_variable" "app-dev-name" {
  key          = "name"
  value        = "tfetest"
  category     = "terraform"
  workspace_id = "${tfe_workspace.app-dev.id}"
}

resource "tfe_variable" "app-dev-location" {
  key          = "location"
  value        = "eastus"
  category     = "terraform"
  workspace_id = "${tfe_workspace.app-dev.id}"
}

resource "tfe_variable" "app-dev-subscriptionid" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = "${var.SUBSCRIPTION_ID}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev.id}"
}

resource "tfe_variable" "app-dev-tenantid" {
  key          = "ARM_TENANT_ID"
  value        = "${var.TENANT_ID}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev.id}"
}

resource "tfe_variable" "app-dev-clientid" {
  key          = "ARM_CLIENT_ID"
  value        = "${var.CLIENT_ID}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev.id}"
}

resource "tfe_variable" "app-dev-clientsecret" {
  key          = "ARM_CLIENT_SECRET"
  value        = "${var.CLIENT_SECRET}"
  category     = "env"
  sensitive    = true
  workspace_id = "${tfe_workspace.app-dev.id}"
}

resource "tfe_variable" "app-dev-destroy" {
  key          = "CONFIRM_DESTROY"
  value        = "1"
  category     = "env"
  workspace_id = "${tfe_workspace.app-dev.id}"
}
