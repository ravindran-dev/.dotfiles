#!/bin/zsh
# =========================================
#  Arch Linux Essentials Setup Script
#  Use this after resetting your Arch PC
#  Author: Ravindran S
# =========================================

# ----------- UPDATE SYSTEM -----------
echo ">>> Updating system..."
sudo pacman -Syu --noconfirm

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
    fastfetch \
    unzip \
    zip \
    gnome-calculator \
    firefox

# ----------- AUR HELPERS -----------
# Paru
echo ">>> Installing paru (AUR helper)..."
if [ ! -d ~/paru ]; then
    git clone https://aur.archlinux.org/paru.git ~/paru
    cd ~/paru
    makepkg -si --noconfirm
    cd ~
fi

# Yay
echo ">>> Installing yay (AUR helper)..."
if [ ! -d ~/yay ]; then
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si --noconfirm
    cd ~
fi

# ----------- SNAP SUPPORT -----------
echo ">>> Installing snapd..."
sudo pacman -S --noconfirm snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap 2>/dev/null || true

# ----------- SHELL CONFIG -----------
# Powerlevel10k (Zsh theme)
echo ">>> Cloning Powerlevel10k..."
if [ ! -d ~/.powerlevel10k ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
fi

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

# =========================================
# END
# After cloning, you may want to:
# - cd into each folder and install requirements
# - For React apps: npm install
# - For Flask apps: pip install -r requirements.txt
# - For tmux plugins: open tmux and run prefix + I
# =========================================
#Save this as clone_repos.sh.

#Make it executable: ./clone_repos.s



#To install neovim in arch linux
#git clone https://github.com/Fawz-Haaroon/nvim ~/.config/nvim
#cd ~/.config/nvim && chmod +x install.sh && bash ./install.shh
