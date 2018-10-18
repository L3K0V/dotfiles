#!/bin/sh

# Enable TouchID on sudo
sudo echo "auth sufficient pam_tid.so" >> /etc/pam.d/sudo

echo "Go to https://www.bresink.com/osx/0TinkerTool/download.php to download TinkerTool"
echo "Setup GPG siging using keybase. Folow https://github.com/pstadler/keybase-gpg-github"
