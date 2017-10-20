#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade --all

# Install packages

apps=(
  bash-completion2
  bats
  battery
  coreutils
  diff-so-fancy
  dockutil
  erlang
  elixir
  ffmpeg
  fasd
  gifsicle
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  heroku-toolbelt
  hub
  htop
  httpie
  imagemagick --with-webp
  jq
  lynx
  mackup
  mitmproxy
  nano
  node
  pandoc
  peco
  pgcli
  postgresql
  psgrep
  python
  rvm
  shellcheck
  siege
  ssh-copy-id
  the_silver_searcher
  tig
  tmux
  tree
  unar
  wget
  wifi-password
  zsh
  zsh-completions
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

# Install GUI applications
# brew install caskroom/cask/brew-cask
brew tap caskroom/cask

# Great homebrew formulas manager
brew cask install launchrocket

#brew tap caskroom/versions

#Install apps
apps=(
  slack
  spotify
  google-chrome
  dropbox
  appcleaner
  firefox
  macdown
  iterm2
  vlc
  google-drive
)

for app in "${apps[@]}"
do
	printf "Should I install %s\n" $app
	echo "Type Y to accept: \c"
	read line
	if [ "$line" = Y ] || [ "$line" = y ]; then
		brew cask install --appdir="/Applications" $app
	fi
done

#Installing fonts
brew tap caskroom/fonts

fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-open-sans
  font-source-sans-pro
  font-lobster
  font-alegreya
  font-montserrat
  font-inconsolata
  font-pt-sans
  font-quattrocento-sans
  font-quicksand
  font-raleway
  font-sorts-mill-goudy
  font-ubuntu
)

# Install fonts
brew cask install ${fonts[@]}

brew cask cleanup


createuser -d postgres              # create the default 'postgres'


# Bunch of symlinks
ln -sfv ~/dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -sfv ~/dotfiles/vim/vimrc.symlink ~/.vimrc
ln -sfv ~/dotfiles/system/alias ~/.alias
ln -sfv ~/dotfiles/system/functions ~/.functions
ln -sfv ~/dotfiles/system/tmux.conf ~/.tmux.conf
ln -sfv ~/dotfiles/git/gitconfig ~/.gitconfig

# Install oh-my-zsh via wget
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp ~/dotfiles/zsh/themes/my-fishy.zsh-theme ~/.oh-my-zsh/themes/my-fishy.zsh-theme

# ZSH auto sugestions commands
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search

# Vim plugins manager
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

# Globally install with npm

packages=(
  get-port-cli
  gtop
  historie
  nodemon
  npm
  release-it
  spot
  superstatic
  svgo
  tldr
  underscore-cli
)

npm install -g "${packages[@]}"

# Install porwerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 ~/fonts

# install
cd ~/fonts
./install.sh

# clean-up a bit
cd ..
rm -rf fonts

# Terminal System Monitory
wget https://github.com/nicolargo/glances/archive/v2.11.tar.gz -O - | tar xz
cd glances-2.11
sudo python setup.py install

cd ..
