#!/bin/bash

cd ansible

ansible-playbook -i inventory 01_install_packages.yml 02_setup_swarm.yml 03_other_config.yml
