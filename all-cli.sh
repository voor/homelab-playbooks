#!/usr/bin/env bash

set -euxo pipefail

sudo -v

sudo dnf install \
  $(curl -sL https://api.github.com/repos/wagoodman/dive/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm) \
  $(curl -sL https://api.github.com/repos/open-policy-agent/conftest/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep -e amd64) \
  $(curl -sL https://api.github.com/repos/vmware-tanzu/octant/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep -e 64bit) \
  https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm \
  $(curl -sL https://api.github.com/repos/mozilla/sops/releases/latest | jq -r '.assets[].browser_download_url' | grep -e x86_64 | grep -e rpm) \
  $(curl -sL https://api.github.com/repos/aquasecurity/trivy/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep 64bit) \
  $(curl -sL https://api.github.com/repos/tektoncd/cli/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep 64bit) \
  $(curl -sL https://api.github.com/repos/anchore/grype/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep amd64) \
  https://zoom.us/client/latest/zoom_x86_64.rpm

sudo bash -c 'curl -L https://carvel.dev/install.sh | bash'

mkdir -p /tmp/new_cli

# pack
curl -sL -o- $(curl -sL https://api.github.com/repos/buildpacks/pack/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep -v sha256 | grep -v arm64) | tar -C /tmp/new_cli -xvz
sudo install -m 755 -g root -o root -Z /tmp/new_cli/pack /usr/local/bin/pack
pack version
rm -rf /tmp/new_cli/pack

# clusterctl
curl -sL -o /tmp/new_cli/clusterctl $(curl -sL https://api.github.com/repos/kubernetes-sigs/cluster-api/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/clusterctl /usr/local/bin/clusterctl
clusterctl version
rm -rf /tmp/new_cli/clusterctl

# clusterawsadm
curl -sL -o /tmp/new_cli/clusterawsadm $(curl -sL https://api.github.com/repos/kubernetes-sigs/cluster-api-provider-aws/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/clusterawsadm /usr/local/bin/clusterawsadm
clusterawsadm version
rm -rf /tmp/new_cli/clusterawsadm

# kind
curl -sL -o /tmp/new_cli/kind $(curl -sL https://api.github.com/repos/kubernetes-sigs/kind/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/kind /usr/local/bin/kind
kind version
rm -rf /tmp/new_cli/kind

# cosign
curl -sL -o /tmp/new_cli/cosign $(curl -sL https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64 | grep -v '\.sig' | grep -v pivkey | grep -v cosigned | grep -v sget | grep -v keyless | grep -v sbom)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/cosign /usr/local/bin/cosign
cosign version
rm -rf /tmp/new_cli/cosign

# cosign - sget
curl -sL -o /tmp/new_cli/sget $(curl -sL https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64 | grep -v '\.sig' | grep -v pivkey | grep -v cosigned | grep sget | grep -v keyless | grep -v sbom)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/sget /usr/local/bin/sget
sget version
rm -rf /tmp/new_cli/sget

# age
curl -sL -o- $(curl -sL https://api.github.com/repos/FiloSottile/age/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64) | tar -C /tmp/new_cli -xvz
sudo install -m 755 -g root -o root -Z /tmp/new_cli/age/age /usr/local/bin/age
sudo install -m 755 -g root -o root -Z /tmp/new_cli/age/age-keygen /usr/local/bin/age-keygen
age --version
age-keygen --version

# oras
curl -sL -o- $(curl -sL https://api.github.com/repos/oras-project/oras/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64 | grep -v '\.asc') | tar -C /tmp/new_cli -xvz
sudo install -m 755 -g root -o root -Z /tmp/new_cli/oras /usr/local/bin/oras
oras version

# kp
curl -sL -o /tmp/new_cli/kp $(curl -sL https://api.github.com/repos/vmware-tanzu/kpack-cli/releases/latest | jq -r '.assets[].browser_download_url' | grep linux)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/kp /usr/local/bin/kp
kp version
rm -rf /tmp/new_cli/kp

# pivnet
curl -sL -o /tmp/new_cli/pivnet $(curl -sL https://api.github.com/repos/pivotal-cf/pivnet-cli/releases/latest | jq -r '.assets[].browser_download_url' | grep linux)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/pivnet /usr/local/bin/pivnet
pivnet version
rm -rf /tmp/new_cli/pivnet

# crane
podman create --name crane gcr.io/go-containerregistry/crane:latest
podman cp crane:/ko-app/crane /tmp/new_cli/crane
podman rm crane
sudo install -m 755 -g root -o root -Z /tmp/new_cli/crane /usr/local/bin/crane
crane version

# pinniped
curl -sL -o /tmp/new_cli/pinniped $(curl -sL https://api.github.com/repos/vmware-tanzu/pinniped/releases/latest | jq -r '.assets[].browser_download_url' | grep linux)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/pinniped /usr/local/bin/pinniped
pinniped version
rm -rf /tmp/new_cli/pinniped

rm -rf /tmp/new_cli