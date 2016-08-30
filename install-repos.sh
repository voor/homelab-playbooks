wget https://dl.google.com/linux/linux_signing_key.pub
sudo rpm --import linux_signing_key.pub

su -c 'dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'

sudo dnf install -y https://downloads.slack-edge.com/linux_releases/slack-2.1.2-0.1.fc21.x86_64.rpm

sudo cp -r yum.repos.d/\* /etc/yum.repos.d/

sudo dnf upgrade --refresh -y
sudo dnf install -y google-chrome-stable

pushd ~
git clone https://github.com/google/fonts.git --depth=1 .fonts
fc-cache -f -v
popd
