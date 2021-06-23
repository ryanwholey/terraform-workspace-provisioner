data "terraform_remote_state" "secrets" {
  backend = "remote"
  config = {
    organization = var.terraform_organization
    workspaces = {
      name = var.secrets_workspace
    }
  }
}

resource "local_file" "backend" {
    content = <<-EOF
      terraform {
        backend "s3" {
          bucket     = "${data.terraform_remote_state.secrets.outputs.storage.bucket}"
          access_key = "${data.terraform_remote_state.secrets.outputs.storage.access_key}"
          secret_key = "${data.terraform_remote_state.secrets.outputs.storage.secret_key}"
          key        = "${var.workspace_name}.tfstate"
          region     = "us-west-2"
        }
      }
    EOF
    filename = "${path.module}/backend.tf"
}