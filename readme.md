# Automation
A set of scripts I use for automating tasks on Linux.

## Resources
All of the systemd units are limited via the `automation.slice` unit in the root of this repo, which specifies the amount of resources that all of the scripts are allowed to use collectively. Adjust this depending on your needs.

## Installation
Execute the `install.sh` script found in the root of this repo. It will set up some base directories, install systemd services, and perform other configuration. It will also execute the installation scripts of the individual units in each folder.