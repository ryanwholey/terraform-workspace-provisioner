#!/bin/sh

set -x

terraform version

mkdir -p terraform-workspace

cd terraform-workspace

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp $TEMPLATE_DIR/basic-vars.tf .
cp $TEMPLATE_DIR/backend.tf .

terraform init
terraform apply -auto-approve

ls -a


cp $TEMPLATE_DIR/workspace.tf .


terraform init
terraform plan
