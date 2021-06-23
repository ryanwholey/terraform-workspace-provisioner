#!/bin/sh

terraform version

mkdir -p terraform-workspace

cd terraform-workspace

cp $DEFAULT_VARS .
cp $PROJECT_VARS .
cp -r $TEMPLATE_DIR .

echo $DEFAULT_VARS
echo $PROJECT_VARS
echo $TEMPLATE_DIR

ls 

terraform init
terraform plan
