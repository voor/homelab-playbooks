#!/bin/bash -exu

pushd ${ANSIBLE_DIR}

ansible-playbook -i hosts.yml rogue.yml -c local
ansible-playbook --vault-password=.secrets/vault.password -i hosts.yml osmc.yml
ansible-playbook --vault-password=.secrets/vault.password -i hosts.yml unifi.yml
