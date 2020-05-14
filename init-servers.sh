#!/bin/bash

cd ansible

ansible-playbook --ask-become-pass -i inventory playbook.yml
