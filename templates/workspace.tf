variable "terraform_organization" {}

variable "secrets_workspace" {}

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

  secrets      = data.terraform_remote_state.secrets.outputs.secrets
  name         = var.workspace_name
  organization = var.terraform_organization
}

terraform {
  backend "s3" {
    bucket         = data.terraform_remote_state.secrets.outputs.storage.bucket
    aws_access_key = data.terraform_remote_state.secrets.outputs.storage.access_key
    aws_secret_key = data.terraform_remote_state.secrets.outputs.storage.secret_key
    key            = "${var.workspace_name}.tfstate"
    region         = "us-west-2"
  }
}
