 #!/bin/sh

if ! [ -x `which brew` ]; then
  echo "install brew"
  brew search
  brew install formula
  brew update # update brew
fi

if ! [ -x `which git` ]; then
  echo "install git"
  brew install git
fi

if ! [ -d ~/.ssh ]; then
  echo "create ~/.ssh directory"
  mkdir ~/.ssh
fi

if ! [ -e ~/.ssh/id_ed25519 ]; then
  echo "create ~/.ssh/ed25519"
  ssh-keygen -t ed25519
  chmod 600 ~/.ssh/id_ed25519
fi

if ! [ -x `which anyenv` ]; then
  echo "install anyenv"
  git clone https://github.com/riywo/anyenv ~/.anyenv
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
  echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
  exec $SHELL -l
fi

sed -i -e 's/^alias subl.*//g' ~/.bash_profile
echo "alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'" >> ~/.bash_profile

ln -sfF `pwd`/.vimrc ~/.vimrc
ln -sfF `pwd`/.vim ~/.vim
ln -sfF `pwd`/.gitconfig ~/.gitconfig

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


