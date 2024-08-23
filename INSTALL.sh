sudo apt update
sudo apt upgrade

sudo apt install bspwm vim git g++ node npm snapd zsh curl thunar zsh-autosuggestions zsh-syntax-highlighting
sudo snap install alacritty --classic

# set up git
git config --global user.name "Sumir Vats"
git config --global user.email "sumirvats@gmail.com"

# set up vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set up zsh with ohmyzsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/mrx04programmer/ZshTheme-ArchCraft/ ~
cp ~/ZshTheme-Archcraft/archcraft-dwm.zsh-theme ~/.oh-my-zsh/themes/
rm -rf ~/ZshTheme-Archcraft
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# clone setup repository
git clone git@github.com:SumirVats2003/dotfiles.git ~

