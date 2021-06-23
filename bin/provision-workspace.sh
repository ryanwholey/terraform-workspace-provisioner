#!/bin/sh

terraform version

mkdir -p terraform-workspace

cd terraform-workspace

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp $TEMPLATE_DIR/backend.tf .

terraform init
terraform plan


# ls 

# terraform init
# terraform plan
