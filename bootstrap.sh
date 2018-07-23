set -e  # exit on error
sudo -v  # require sudo

if_repository () {
	return git rev-parse 2> /dev/null; [ $? == 0 ] && echo 1
}

filenames=("$HOME/.ssh/id_rsa" "$HOME/.ssh/id_rsa.pub")
for filename in $filenames; do
	if [ ! -e $filename ]; then
		printf "%s does not exist. Please add this file and run this script again!\n" $filename
		exit 1
	fi
	chmod 400 $filename
done

for filename in ~/.ssh/*.pem; do
	chmod 400 $filename
done

sudo apt install python3-pip python3-minimal -y
sudo ln -sf /usr/bin/pip3 /usr/bin/pip
sudo ln -sf /usr/bin/python3 /usr/bin/python

cd
sudo apt-get install git -y
if [ ! if_repository ]; then
	git init
	git remote add origin git@github.com:jacsmith21/dotfiles.git
	git pull origin master
else
	echo "$HOME is already a git repository."
fi

# move tilix settings
dconf load /com/gexperts/Tilix/ < tilix.dconf

pip install git+https://github.com/jacsmith21/oversee
oversee export local
# oversee setup default
oversee setup python
# oversee setup web
oversee setup work

oversee sync pycharm
oversee sync webstorm

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh
chsh -s $(which zsh)
echo "Please logout and log back in to activate zsh!"

# TODO: export PATH=~/.local/bin:$PATH; oversee use; add unbootstrap.sh to back stuff up 
