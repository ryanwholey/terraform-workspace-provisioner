#!/bin/sh

terraform version

mkdir -p terraform-workspace

cd terraform-workspace

cp $TEMPLATE_DIR/backend.tf .

terraform init
terraform plan

# cp $DEFAULT_VARS .
# cp $PROJECT_VARS .

# ls 

# terraform init
# terraform plan
