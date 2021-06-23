#!/bin/sh

terraform version

mkdir -p terraform-workspace

cd terraform-workspace

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp -r $TEMPLATE_DIR .

terraform init
terraform plan
