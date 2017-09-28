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

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

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
  ffmpeg
  fasd
  gifsicle
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  hub
  httpie
  imagemagick --with-webp
  jq
  lynx
  mackup
  nano
  node
  pandoc
  peco
  psgrep
  python
  rvm
  shellcheck
  ssh-copy-id
  the_silver_searcher
  tmux
  tree
  unar
  wget
  wifi-password
  zsh
)

brew install "${apps[@]}"

# Remove outdated versions from the cellar
brew cleanup

# Install GUI applications
#brew tap caskroom/cask
#brew install brew-cask
#brew tap caskroom/versions

#brew cask install atom
#brew cask install vlc

#brew cask cleanup

# Bunch of symlinks
ln -sfv ~/dotfiles/zsh/zshrc.symlink ~/.zsh
ln -sfv ~/dotfiles/vim/vimrc.symlink ~/.vimrc
ln -sfv ~/dotfiles/system/alias ~/.alias
ln -sfv ~/dotfiles/system/tmux.conf ~/.tmux.conf
ln -sfv ~/dotfiles/git/gitconfig ~/.gitconfig

# Install oh-my-zsh via wget
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

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
