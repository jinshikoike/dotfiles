 #!/bin/sh
ln -sfF ~/.dotfiles/.vimrc ~/.vimrc
ln -sfF ~/.dotfiles/.vim ~/.vim
ln -sfF ~/.dotfiles/.ssh ~/.ssh
ln -sfF ~/.dotfiles/.profile ~/.profile
ln -sfF ~/.dotfiles/.bash_profile ~/.bash_profile
ln -sfF ~/.dotfiles/.gitconfig ~/.gitconfig

file_path="install.sh"
if [ -f "$file_path" ]
then
    echo "neo bundle is already installed"
else
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
    chmod 755 install.sh
    ./install.sh
    rm ./install.sh
fi

# vim
# tmux

