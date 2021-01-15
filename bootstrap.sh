set -e  # exit on error
sudo -v  # require sudo

exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! exists brew; then
	echo "Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if ! exists cargo; then
	echo "Installing rust"
	curl https://sh.rustup.rs -sSf -o install-rust.sh
	chmod +x install-rust.sh
	./install-rust.sh -y
	rm -rf install-rust.sh
fi

cp .gitconfig ~/.gitconfig

cp keybindings.json ~/Library/Application\ Support/Code/User

mkdir -p ~/.ssh
cp .ssh/* ~/.ssh

filenames=("$HOME/.ssh/id_rsa" "$HOME/.ssh/id_rsa.pub")
for filename in $filenames; do
	if [ ! -e $filename ]; then
		printf "%s does not exist. Please add this file and run this script again!\n" $filename
		exit 1
	fi
	chmod 400 $filename
done

brew install rocket

echo "Installing ZSH"
brew install zsh
cp .zshrc ~/.zshrc


if [ ! -f $NVM_DIR/nvm.sh ]; then
	echo "Install nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
else
	\. $NVM_DIR/nvm.sh
	nvm install 12
	nvm alias default 12
	npm install -g spaceship-prompt
fi

# TODO
# https://wallpapers.hector.me/static/Rainbow.jpg

# brew does this automatically
# # TODO THIS SHOULD ONLY RUN ONCE
# sudo sh -c "echo $(which zsh) >> /etc/shells"
# chsh -s $(which zsh)

if ! exists nvim then
  # brew install the_silver_searcher
  brew install neovim
  # url -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  #   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Please logout and log back in to activate zsh!"
