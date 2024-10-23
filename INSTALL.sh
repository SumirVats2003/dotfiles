sudo add-apt-repository universe
sudo add-apt-repository multiverse

sudo apt update
sudo apt upgrade

sudo apt install bspwm vim git g++ nodejs npm snapd zsh curl thunar zsh-autosuggestions zsh-syntax-highlighting
sudo snap install alacritty --classic
sudo snap install code --classic

# set up git
git config --global user.name "Sumir Vats"
git config --global user.email "sumirvats@gmail.com"

# set up vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set up zsh with ohmyzsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/ ~/zsh-theme
cp ~/zsh-theme/archcraft-dwm.zsh-theme ~/.oh-my-zsh/themes/archcraft-dwm.zsh-theme
rm -rf ~/zsh-theme
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# clone setup repository
git clone https://github.com/SumirVats2003/dotfiles.git ~/dotfiles
cp ~/dotfiles/.vimrc ~/.vimrc
cp ~/dotfiles/.zshrc ~/.zshrc
cp -r ~/dotfiles/.config ~/.config
rm -rf dotfiles/
