#!/bin/zsh
# =========================================
#  Arch Linux Essentials Setup Script
#  Use this after resetting your Arch PC
#  Author: Ravindran S
# =========================================

# ----------- UPDATE SYSTEM -----------
echo ">>> Updating system..."
sudo pacman -Syu --noconfirm

# To get the mirrorlist

echo ">>> Installing mirrorlist...."
sudo cp -rf /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
sudo cp -rf ~/Downloads/mirrorlist /etc/pacman.d/mirrorlist
sudo pacman -Syu

# Set timezone to Asia/Kolkata
echo ">>> Setting timezone to Asia/Kolkata..."
sudo timedatectl set-timezone Asia/Kolkata


# ----------- ESSENTIAL PACKAGES -----------
echo ">>> Installing Arch essentials..."
sudo pacman -S --noconfirm \
    base-devel \
    git \
    wget \
    curl \
    neovim \
    tmux \
    zsh \
    htop \
    btop \
    kdeconnect \
    fastfetch \
    unzip \
    zip \
    zlib \
    xz \
    tk \
    kcalc \
    firefox \
    discord

# ----------- AUR HELPERS -----------
# Paru
echo ">>> Installing paru (AUR helper)..."
if [ ! -d ~/paru ]; then
    git clone https://aur.archlinux.org/paru.git ~/paru
    cd ~/paru
    makepkg -si 
    cd ~
fi

# Yay
echo ">>> Installing yay (AUR helper)..."
if [ ! -d ~/yay ]; then
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si 
    cd ~
fi

#-----installing Brave browser--------
echo ">>> Installing brave browser..."
export PATH="$HOME/.local/bin:$PATH"
if ! command -v paru &> /dev/null; then
    echo "paru not found. Please restart your shell or source ~/.zshrc before running this script."
    exit 1
fi
paru -S brave-bin

#-----installing VS code--------------
echo ">>> installing VS code..."
yay -S visual-studio-code-bin

#------installing google-chrome-------

echo ">>> installing google-chrome...."
yay -S google-chrome

#------installing spotify-------
echo ">>> installing spotify...."
yay -S spotify

# ----------- SNAP SUPPORT -----------
echo ">>> Installing snapd..."
yay -S --noconfirm snapd
sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
snap version
sudo snap install hello-world


# ----------- SHELL CONFIG -----------
# Powerlevel10k (Zsh theme)
echo ">>> Cloning Powerlevel10k..."
# Create plugin folder if not exists
mkdir -p ~/.zsh

# 1. Zsh Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# 2. Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

# 3. Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k


# ----------- TMUX CONFIG -----------
# Tmux Plugin Manager (TPM)
echo ">>> Cloning Tmux Plugin Manager..."

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# ----------- FINAL MESSAGE -----------
echo ">>> Setup complete!"
echo "Run 'chsh -s $(which zsh)' to set zsh as your default shell."
echo "Open tmux and press prefix + I to install tmux plugins."


echo ">>> Installing Github-cli..."
sudo pacman -S github-cli
gh auth login
# =========================================
# END
# After cloning, you may want to:
# - cd into each folder and install requirements
# - For React apps: npm install
# - For Flask apps: pip install -r requirements.txt
# - For tmux plugins: open tmux and run prefix + I
# =========================================
#Save this as clone_repos.sh.

#Make it executable: chmod +x ~/dotfiles/clone_repos.sh

#Run it using:  cd ~/dotfiles
#               ./clone_repos.sh



#To install neovim in arch linux
#git clone https://github.com/Fawz-Haaroon/nvim ~/.config/nvim
#cd ~/.config/nvim && chmod +x install.sh && bash ./install.shh


#To have beautifull progress bar

#Run: sudo nano /etc/pacman.conf
#scroll to the [options] section, add a new line containing exactly "ILoveCandy"


#Save and exit at nano
#ctrl+o, enter and ctrl+x



