sudo pacman -Syu

# installing yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

yay -Y --gendb
yay -Syu --devel
yay -Y --devel --save

# general utilities
sudo pacman -S zsh alacritty go rofi hyprpaper waybar dunst yazi thunar lazygit tmux shotwell fzf zathura zathura-pdf-poppler brightnessctl
git config --global user.name "Sumir Vats"
git config --global user.email "sumirvats@gmail.com"
go install go.senan.xyz/cliphist@latest

# screenshot utilty
sudo pacman -S grim imagemagick wl-clipboard
yay -S quickshell
git clone https://github.com/jamdon2/hyprquickshot ~/.config/quickshell/hyprquickshot

# zen browser
curl -fsSL https://github.com/zen-browser/updates-server/raw/refs/heads/main/install.sh | sh

# copy my dotfiles
cd ~/dotfiles
cp .zshrc ~/.zshrc
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp .tmux.conf ~/.tmux.conf
cp -r .config/* ~/.config/

# shell - run this after installing oh-my-zsh
git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/ ~/zsh-theme
cp ~/zsh-theme/archcraft-dwm.zsh-theme ~/.oh-my-zsh/themes/archcraft-dwm.zsh-theme
rm -rf ~/zsh-theme
