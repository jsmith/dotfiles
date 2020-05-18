set -e  # exit on error
sudo -v  # require sudo

PYTHON="0"
UTILS="0"
VIM="0"

while getopts ":ht" opt; do
  case ${opt} in
    python ) # process option a
		PYTHON="1"
      ;;
	utils ) # process option a
		UTILS="1"
      ;;
    vim )
      VIM="1"
    \? ) 
		echo "Usage: bootstrap.sh [--python] [--utils]"
		exit
      ;;
  esac
done

cp .gitconfig ~/.gitconfig

mkdir -p ~/.ssh
cp .ssh/* ~/.ssh

mkdir -p ~/.config
cp .config/* ~/.config

echo ""
filenames=("$HOME/.ssh/id_rsa" "$HOME/.ssh/id_rsa.pub")
for filename in $filenames; do
	if [ ! -e $filename ]; then
		printf "%s does not exist. Please add this file and run this script again!\n" $filename
		exit 1
	fi
	chmod 400 $filename
done

echo "Installing ZSH"
brew install zsh

# TODO THIS SHOULD ONLY RUN ONCE
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

cp .zshrc ~/.zshrc

if [ $PYTHON == "1" ] then
	sudo apt install python3-pip python3-minimal -y
	sudo ln -sf /usr/bin/pip3 /usr/bin/pip
	sudo ln -sf /usr/bin/python3 /usr/bin/python
fi

if [ $UTILS == "1" ] then
	sudo apt-get install silversearcher-ag
	sudo apt install flameshot
	sudo apt-get install ripgrep
fi

if [ $VIM == "1" ] then
  brew install the_silver_searcher
  brew install neovim
  url -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Please logout and log back in to activate zsh!"
echo "Set your backgroud as well!"
