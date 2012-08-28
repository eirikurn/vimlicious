# Check if vimlicious is already installed.
if [ -d ~/.vimlicious ]; then
  echo "\033[0;31mEy! You already have vimlicious installed.\033[0m"
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
  echo "\033[0;34mFound old .vimrc. Backing it up to ~/.vimrc.pre-vimlicious\033[0m"
  cp ~/.vimrc ~/.vimrc.pre-vimlicious;
  rm ~/.vimrc;
fi

echo "\033[0;34mLooking for an existing .vim folder...\033[0m"
if [ -d ~/.vim ]
then
  echo "\033[0;34mFound .vim folder. Backing it up to ~/.vim.pre-vimlicious\033[0m"
  mv ~/.vim ~/.vim.pre-vimlicious;
fi

echo "\033[0;34minitializing vimlicious..\033[0m"
~/.vimlicious/bin/vimlicious init

echo "\033[0;34m"'       _           _ _      _                  '"\033[0m"           
echo "\033[0;34m"'      (_)         | (_)    (_)                 '"\033[0m"
echo "\033[0;34m"'__   ___ _ __ ___ | |_  ___ _  ___  _   _ ___  '"\033[0m"
echo "\033[0;34m"'\ \ / / |  _   _ \| | |/ __| |/ _ \| | | / __| '"\033[0m"
echo "\033[0;34m"' \ V /| | | | | | | | | (__| | (_) | |_| \__ \ '"\033[0m"
echo "\033[0;34m"'  \_/ |_|_| |_| |_|_|_|\___|_|\___/ \__,_|___/ '"\033[0m"
echo "\n\n \033[0;34m....is ready to rock.\033[0m"