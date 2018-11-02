// resource "tfe_workspace" "this" {
//   name              = "enterprise-workspaces"
//   organization      = "${var.organization}"
//   working_directory = "enterprise-workspaces"

//   vcs_repo {
//     identifier     = "${var.vsc_identifier}"
//     oauth_token_id = "${var.vsc_token}"
//   }
// }

// resource "tfe_variable" "this-organization" {
//   key          = "organization"
//   value        = "${var.organization}"
//   category     = "terraform"
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-vsc_identifier" {
//   key          = "vsc_identifier"
//   value        = "${var.vsc_identifier}"
//   category     = "terraform"
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-vsc_token" {
//   key          = "vsc_token"
//   value        = "${var.vsc_token}"
//   category     = "terraform"
//   sensitive    = true
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-tfe_token" {
//   key          = "tfe_token"
//   value        = "${var.tfe_token}"
//   category     = "terraform"
//   sensitive    = true
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-subscriptionid" {
//   key          = "SUBSCRIPTION_ID"
//   value        = "${var.SUBSCRIPTION_ID}"
//   category     = "terraform"
//   sensitive    = true
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-tenantid" {
//   key          = "TENANT_ID"
//   value        = "${var.TENANT_ID}"
//   category     = "terraform"
//   sensitive    = true
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-clientid" {
//   key          = "CLIENT_ID"
//   value        = "${var.CLIENT_ID}"
//   category     = "terraform"
//   sensitive    = true
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-clientsecret" {
//   key          = "CLIENT_SECRET"
//   value        = "${var.CLIENT_SECRET}"
//   category     = "terraform"
//   sensitive    = true
//   workspace_id = "${tfe_workspace.this.id}"
// }

// resource "tfe_variable" "this-destroy" {
//   key          = "CONFIRM_DESTROY"
//   value        = "1"
//   category     = "env"
//   workspace_id = "${tfe_workspace.this.id}"
// }
