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
sudo pacman -S zsh kitty go hyprpaper hyprlock hyprsunset waybar dunst yazi dolphin lazygit tmux shotwell fzf zathura zathura-pdf-poppler brightnessctl qt5-quickcontrols2 qt5-graphicaleffects qt5-svg archlinux-xdg-menu kvantum-qt5 kservice5
yay -S wlogout
git config --global user.name "Sumir Vats"
git config --global user.email "sumirvats@gmail.com"

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
# git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/ ~/zsh-theme
# cp ~/zsh-theme/archcraft-dwm.zsh-theme ~/.oh-my-zsh/themes/archcraft-dwm.zsh-theme
# rm -rf ~/zsh-theme
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
