set -e  # exit on error
sudo -v  # require sudo

exists() {
  command -v "$1" >/dev/null 2>&1
}

if ! exists brew; then
	echo "Installing brew!"
 	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if [ ! -e $HOME/.cargo/bin/cargo ]; then
	echo "Installing rust!"
	curl https://sh.rustup.rs -sSf -o install-rust.sh
	chmod +x install-rust.sh
	./install-rust.sh -y
	rm -rf install-rust.sh
fi

echo "Install gitconfig!"
cp .gitconfig ~/.gitconfig

echo "Installing VS Code keybindings!"
cp keybindings.json ~/Library/Application\ Support/Code/User

echo "Installing Rocket!"
brew install rocket

echo "Installing ZSH!"
brew install zsh
cp .zshrc ~/.zshrc


if [ ! -f $NVM_DIR/nvm.sh ]; then
	echo "Install nvm!"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
fi

echo "Setting default node version -> 12!"
\. $HOME/.nvm/nvm.sh
nvm install 12
nvm alias default 12

echo "Installing Spaceship Prompt!"
npm install -g spaceship-prompt

# brew does this automatically
# # TODO THIS SHOULD ONLY RUN ONCE
# sudo sh -c "echo $(which zsh) >> /etc/shells"
# chsh -s $(which zsh)

if ! exists nvim; then	
	echo "Installing nvim!"
	# brew install the_silver_searcher
	brew install neovim
	# url -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Please logout and log back in to activate zsh!"
