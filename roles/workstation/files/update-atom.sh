#!/usr/bin/env sh
set -e

command -v jq >/dev/null 2>&1 || { echo >&2 "I require jq but it's not installed.  Aborting."; exit 1; }
command -v curl >/dev/null 2>&1 || { echo >&2 "I require curl but it's not installed.  Aborting."; exit 1; }

INSTALLED_ATOM=`rpm -q --queryformat '%{version}' atom`
LATEST_ATOM=`curl -s https://api.github.com/repos/atom/atom/releases/latest | jq --raw-output -c '.name'`
COMPARE=`printf "$INSTALLED_ATOM\n$LATEST_ATOM\n" | sort -V | tail -n1`

if [ "$COMPARE" == "$INSTALLED_ATOM" ]; then
  echo "Latest verion is installed, no further action"
else
  echo "Newer version available: $LATEST_ATOM"
  sudo dnf install -y `curl -s https://api.github.com/repos/atom/atom/releases/latest | jq --raw-output -c '.assets[] | select(.name | contains("atom.x86_64.rpm")) | .browser_download_url'`
fi
