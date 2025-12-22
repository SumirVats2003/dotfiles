sudo pacman -Syu

sudo pacman -S git zsh kitty go

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
sudo pacman -S wofi hyprpaper waybar dunst thunar lazygit tmux shotwell fzf
git config --global user.name "Sumir Vats"
git config --global user.email "sumirvats@gmail.com"
go install go.senan.xyz/cliphist@latest

# screenshot utilty
sudo pacman -S grim imagemagick wl-clipboard
yay -S quickshell
git clone https://github.com/jamdon2/hyprquickshot ~/.config/quickshell/hyprquickshot

# brave
curl -fsS https://dl.brave.com/install.sh | sh

# copy my dotfiles
cd ~
git clone https://github.com/SumirVats2003/dotfiles df
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp -r .config/* ~/.config/

# shell
git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/ ~/zsh-theme
cp ~/zsh-theme/archcraft-dwm.zsh-theme ~/.oh-my-zsh/themes/archcraft-dwm.zsh-theme
rm -rf ~/zsh-theme
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
