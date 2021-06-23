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
