# Check if vimlicious is already installed.
if [ -d "$HOME/.vimlicious" ]; then
    echo "\033[0;31mYou already have vimlicious installed.\033[0m"
    echo "\033[0;31mRemove ~/.vimlicious and try again.\033[0m"
    exit
fi

echo "\033[0;34mCloning vimlicious\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/hlysig/vimlicious.git ~/.vimlicious || {
    echo "\033[0;31mGit is not installed. Get it and run this script again.\033[0m"
    exit
}

echo "\033[0;34mLooking for an existing vim config...\033[0m"
if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]
then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32]Backing up to ~/.vimrc.pre-vimlicious\033[0m";
  cp ~/.vimrc ~/.vimrc.pre-vimlicious;
  rm ~/.vimrc;
fi

echo "\033[0;34mUsing vimlicious template file and adding it to ~/.vimrc\033[0m"
cp ~/.vimlicious/templates/vimrc ~/.vimrc


echo "\033[0;34mLooking for an existing local vim config...\033[0m"
if [ -f ~/.vimrc.local ] || [ -h ~/.vimrc.local ]
then
  echo "\033[0;33mFound ~/.vimrc.local.\033[0m \033[0;32]Backing up to ~/.vimrc.local.pre-vimlicious\033[0m";
  cp ~/.vimrc.local ~/.vimrc.local.pre-vimlicious;
  rm ~/.vimrc.local;
fi

echo "\033[0;34mCreating empty .vimrc.local. Place all your vim configuration there.\033[0m"
touch ~/.vimrc.local

echo "\033[0;34minitializing vimlicious..\033[0m"
export PATH=$PATH:~/.vimlicious/bin
~/.vimlicious/bin/vimlicious init

echo "\033[0;34m"'       _           _ _      _                  '"\033[0m"           
echo "\033[0;34m"'      (_)         | (_)    (_)                 '"\033[0m"
echo "\033[0;34m"'__   ___ _ __ ___ | |_  ___ _  ___  _   _ ___  '"\033[0m"
echo "\033[0;34m"'\ \ / / |  _   _ \| | |/ __| |/ _ \| | | / __| '"\033[0m"
echo "\033[0;34m"' \ V /| | | | | | | | | (__| | (_) | |_| \__ \ '"\033[0m"
echo "\033[0;34m"'  \_/ |_|_| |_| |_|_|_|\___|_|\___/ \__,_|___/ '"\033[0m"
echo "\n\n \033[0;34m....is ready to rock.\033[0m"
