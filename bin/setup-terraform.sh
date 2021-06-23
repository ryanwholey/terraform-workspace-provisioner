#!/bin/sh

curl -o terraform.zip https://releases.hashicorp.com/terraform/0.15.5/terraform_0.15.5_linux_amd64.zip 
unzip -f -d /usr/local/bin terraform.zip
terraform version