sudo dnf install \
  $(curl -sL https://api.github.com/repos/wagoodman/dive/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm) \
  $(curl -sL https://api.github.com/repos/open-policy-agent/conftest/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep -e amd64) \
  $(curl -sL https://api.github.com/repos/vmware-tanzu/octant/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep -e 64bit) \
  https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm \
  $(curl -sL https://api.github.com/repos/mozilla/sops/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm) \
  $(curl -sL https://api.github.com/repos/aquasecurity/trivy/releases/latest | jq -r '.assets[].browser_download_url' | grep -e rpm | grep 64bit) \
  https://zoom.us/client/latest/zoom_x86_64.rpm