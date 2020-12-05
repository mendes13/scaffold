# === base ===
sudo pacman -S curl git

# yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
# check a better way to do this, maybe use /tmp folder
cd $HOME
rm -rf yay


# === basic GUI stuff === 
sudo pacman -S xorg xorg-xinit nitrogen picom
sudo pacman -S xmonad xmonad-contrib xmobar dmenu dunst scrot pulseaudio pavucontrol


# === terminal stuff ===
sudo pacman -S zsh vim tmux termite xterm xclip gvim rsync

chsh -s /usr/bin/zsh

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# === personal applications ===
yay -S brave-bin
yay -S spotify # TODO: the gpg always break, check how to fix it
yay -S slack-desktop
sudo pacman -S discord


# === dev ===

# docker
sudo pacman -S docker

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
cd $HOME

sudo pacman -S yarn

sudo pacman -S postgres

# java 1.8
sudo pacman -S jdk8-openjdk