#!/bin/bash

# Set Vagrant environment path
vagrant_path=".vagrant"

# Change permissions for private_key files
sudo chmod 666 $vagrant_path/machines/*/virtualbox/private_key

# Show permissions for private_key files
sudo ls -l $vagrant_path/machines/*/virtualbox/private_key