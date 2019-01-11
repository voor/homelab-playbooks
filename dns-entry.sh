#!/bin/sh

# Just add this to your ~/.bashrc or ~/.zshrc file.
dnsentry() {
  if [ $# -eq 0 ]; then
    echo "set system static-host-mapping host-name host1 inet 1.1.1.1"
  else
    echo "set system static-host-mapping host-name $1 inet $2"
  fi
}

dnsentry "$@"
