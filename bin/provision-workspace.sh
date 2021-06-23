#!/bin/sh

set -x

terraform version

mkdir -p create-backend
cd create-backend

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp $TEMPLATE_DIR/basic-vars.tf .
cp $TEMPLATE_DIR/backend.tf .

terraform init
terraform apply -auto-approve

cd ../

mkdir -p terraform-workspace
cd terraform-workspace

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp $TEMPLATE_DIR/basic-vars.tf .
cp $TEMPLATE_DIR/workspace.tf .
cp ../create-backend/backend.tf .

ls -a

terraform init
terraform apply -auto-approve
