set -e  # exit on error
sudo -v  # require sudo

PYTHON="0"
UTILS="0"

while getopts ":ht" opt; do
  case ${opt} in
    python ) # process option a
		PYTHON="1"
      ;;
	utils ) # process option a
		UTILS="1"
      ;;
    \? ) 
		echo "Usage: bootstrap.sh [--python] [--utils]"
		exit
      ;;
  esac
done

# cp .zshrc ~/.zshrc
# cp .gitconfig ~/.gitconfig

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

# cd ~/Pictures
# wget https://cdn.dribbble.com/users/108482/screenshots/1355879/attachments/193117/Space-Desktop.jpg

# move tilix settings
# dconf load /com/gexperts/Tilix/ < tilix.dconf

# pip install git+https://github.com/jacsmith21/oversee
# oversee export local
# oversee setup default
# oversee setup python
# oversee setup web
# oversee setup work

# oversee sync pycharm
# oversee sync webstorm

# sudo apt-get update
# sudo apt-get upgrade
# sudo apt-get install zsh


echo "Please logout and log back in to activate zsh!"
echo "Set your backgroud as well!"

# TODO: export PATH=~/.local/bin:$PATH; oversee use; add unbootstrap.sh to back stuff up 
