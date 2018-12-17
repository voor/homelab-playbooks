curl -o google_chrome.pub https://dl.google.com/linux/linux_signing_key.pub && \
  sudo rpm --import google_chrome.pub && \
  rm -rf google_chrome.pub

curl -o oracle_vbox.asc https://www.virtualbox.org/download/oracle_vbox.asc && \
  sudo rpm --import oracle_vbox.asc && \
  rm -rf oracle_vbox.asc

curl -o docker.gpg https://yum.dockerproject.org/gpg && \
  sudo rpm --import docker.gpg && \
  rm -rf docker.gpg

su -c 'dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

sudo dnf install -y https://downloads.slack-edge.com/linux_releases/slack-3.3.3-0.1.fc21.x86_64.rpm

sudo cp -r yum.repos.d/* /etc/yum.repos.d/

sudo dnf config-manager --set-enabled rpmfusion-nonfree-steam

sudo dnf upgrade --refresh -y
sudo dnf install -y google-chrome-beta kernel-devel kernel-headers

sudo dnf install -y gstreamer{1,}-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0

git clone https://github.com/google/fonts.git --depth=1 ~/.fonts
fc-cache -f -v
