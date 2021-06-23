#!/bin/sh

terraform version

mkdir -p terraform-workspace

cd terraform-workspace

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp $TEMPLATE_DIR/basic-vars.tf .
cp $TEMPLATE_DIR/backend.tf .

terraform init
terraform apply -auto-approve
rm -rf .terraform
rm -rf .terraform.tfstate
rm -rf .terraform.tfstate.backup

cp $TEMPLATE_DIR/workspace.tf .
terraform init
terraform plan
