#!/bin/sh

# import repositories we need

## workstation repos just in case
sudo dnf install -y fedora-workstation-repositories

## RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

## VS Code
rpm --import https://packages.microsoft.com/keys/microsoft.asc -y
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

## COPR repos
sudo dnf copr enable lizardbyte/stable
sudo dnf copr enable dejan/lazygit

## Docker
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

## Google Chrome
sudo dnf config-manager setopt google-chrome.enabled=1

# install packages
sudo dnf install --skip-unavailable -y google-chrome-stable discord steam zsh code Sunshine gnome-tweaks curl git stow kitty openrgb fira-code-fonts lazygit nvim fastfetch bat zsh-syntax-highlighting zsh-autosuggestions

## Docker - separated to keep clean
sudo dnf install --skip-unavailable -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

flatpak install -y flathub com.mattjakeman.ExtensionManager com.spotify.Client io.missioncenter.MissionCenter

# non-package managed apps
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sh -c "$(curl -sS https://vencord.dev/install.sh)"
curl -fsSL https://bun.com/install | bash

# enable docker
sudo systemctl enable --now docker

# setup config
mkdir .icons
curl --output .icons/kitty_icon.png "https://raw.githubusercontent.com/hristost/kitty-alternative-icon/refs/heads/main/kitty_icon.png"

git config --global user.email "jwright3478@gmail.com"
git config --global user.name "Jamie Wright"
git clone https://github.com/the-wright-jamie/.dotfiles.git

cd .dotfiles
stow .
cd ..

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "===== NEXT STEPS ====="
echo "Congrats, your system should be mostly provisioned and configured by now. The usual apps you use should be available, though some manual configuration may be required - you might be able to complete this in most apps by signing into them and downloading your cloud configurations. For others, you may need to manually set them up (such as Steam Game downloads)."
echo ""
echo "Happy computing!"

