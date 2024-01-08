sudo apt update
sudo apt upgrade

sudo apt install i3 vim git g++ node npm alacritty zsh curl

# set up git
git config --global user.name "Sumir Vats"
git config --global user.email "sumirvats@gmail.com"

# set up vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# set up zsh with ohmyzsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# clone setup repository
git clone git@github.com:SumirVats2003/dotfiles.git ~

