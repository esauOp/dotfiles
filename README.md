# Esau's dotfiles
Here you gonna find my current MBP setup for work.

# OS X setup
You need to have XCode or, at the very minimum, the XCode Command Line Tools, which are available as a much smaller download.
Execute sudo xcodebuild -license and follow the instructions to accept the XCode agreement. After that you just run xcode-select --install and proceed with the installation.

1.- Clone this project:
```
git clone https://github.com/esauOp/dotfiles.git ~/dotfiles && cd ~/dotfiles
```
2.- Run the install script
```
sh ./install.sh
```
2.- If you are an Ubuntu user, install by
```
bash ./ubuntu_install
```

And `reboot` after.

3.- Change your shell
```
chsh -s /bin/zsh
```
4.- Create the default `postgres` user.
```
createuser -d postgres
```

### Don't forget generate your SSH Key

[GitHub Help](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)