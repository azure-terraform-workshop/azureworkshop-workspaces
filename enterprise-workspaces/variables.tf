variable "TENANT_ID" {}
variable "SUBSCRIPTION_ID" {}
variable "CLIENT_ID" {}
variable "CLIENT_SECRET" {}

variable "organization" {}
variable "vsc_identifier" {}
variable "vsc_token" {}

variable "tfe_token" {}

provider "tfe" {
  token = "${var.tfe_token}"
}
