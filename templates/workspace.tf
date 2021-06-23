variable "terraform_organization" {}

variable "secrets_workspace" {}
variable "secrets_key" {}

variable "backend_storage_name" {}
variable "workspace_name" {}

data "terraform_remote_state" "secrets" {
  backend = "remote"
  config = {
    organization = var.terraform_organization
    workspaces = {
      name = var.secrets_workspace
    }
  }
}

module "project" {
  source  = "github.com/ryanwholey/terraform-workspace-manager//modules/project"

  secrets      = data.terraform_remote_state.secrets.outputs[var.secrets_key]
  name         = var.workspace_name
  organization = var.terraform_organization
}

terraform {
  backend "s3" {
    bucket = data.terraform_remote_state.secrets.outputs.storage_bucket
    key    = "${var.workspace_name}.tfstate"
    region = "us-west-2"
  }
}
