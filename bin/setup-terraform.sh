#!/bin/sh

which curl || true
which wget || true
which sudo || true

# apt-get update && apt-get install -y gnupg software-properties-common curl
# curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
# sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
# sudo apt-get update && sudo apt-get install terraform
