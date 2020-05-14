#!/bin/bash

cd ansible

# TODO --ask-become-pass I am sure there is a better way
ansible-playbook --ask-become-pass -i inventory 01_install_packages.yml
ansible-playbook --ask-become-pass -i inventory 02_setup_swarm.yml
