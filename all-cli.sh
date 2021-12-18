sudo -v

sudo dnf install \
  $(curl -sL https://api.github.com/repos/wagoodman/dive/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm) \
  $(curl -sL https://api.github.com/repos/open-policy-agent/conftest/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep -e amd64) \
  $(curl -sL https://api.github.com/repos/vmware-tanzu/octant/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep -e 64bit) \
  https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm \
  $(curl -sL https://api.github.com/repos/mozilla/sops/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm) \
  $(curl -sL https://api.github.com/repos/aquasecurity/trivy/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep 64bit) \
  $(curl -sL https://api.github.com/repos/tektoncd/cli/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep 64bit) \
  https://zoom.us/client/latest/zoom_x86_64.rpm

sudo bash -c 'curl -L https://carvel.dev/install.sh | bash'

# oras
# kp
# pivnet
# age + age-keygen

mkdir -p /tmp/new_cli

# clusterctl
curl -sL -o /tmp/new_cli/clusterctl $(curl -sL https://api.github.com/repos/kubernetes-sigs/cluster-api/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/clusterctl /usr/local/bin/clusterctl
clusterctl version

# kind
curl -sL -o /tmp/new_cli/kind $(curl -sL https://api.github.com/repos/kubernetes-sigs/kind/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/kind /usr/local/bin/kind
kind version

# cosign
curl -sL -o /tmp/new_cli/cosign $(curl -sL https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64 | grep -v '\.sig' | grep -v pivkey | grep -v cosigned | grep cosign)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/cosign /usr/local/bin/cosign
cosign version

# cosign - sget
curl -sL -o /tmp/new_cli/sget $(curl -sL https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r '.assets[].browser_download_url' | grep linux | grep amd64 | grep -v '\.sig' | grep -v pivkey | grep -v cosigned | grep sget)
sudo install -m 755 -g root -o root -Z /tmp/new_cli/sget /usr/local/bin/sget
sget version

# crane
podman create --name crane gcr.io/go-containerregistry/crane:$(curl -sL https://api.github.com/repos/google/go-containerregistry/releases/latest | jq .name -rc)
podman cp crane:/ko-app/crane /tmp/new_cli/crane
podman rm crane
sudo install -m 755 -g root -o root -Z /tmp/new_cli/crane /usr/local/bin/crane
crane version

rm -rf /tmp/new_cli