#!/bin/bash

echo "*******************************************************"
echo "*                                                     *"
echo "*  Name:    Term Awesome                              *"
echo "*  Author:  Eli Lin                                   *"
echo "*  Version: 1.0.0                                     *"
echo "*  Date:    2019/10/25                                *"
echo "*                                                     *"
echo "*******************************************************"
echo ""

{
  # Installing homebrew
  os=""
  if [[ $OSTYPE == *"darwin"* ]]; then
    echo "💻 Darwin OS detected."
    os="darwin"
  fi
  echo ""
  
  if [ $os == 'darwin' ]; then
    echo ""
    echo "Installing Homebrew ......"
    printf "Checkout \e[32mhttps://brew.sh/\e[m\n"
    if ! [ -f "/usr/local/bin/brew" ]; then
      # Installing homebrew
      echo "⚠️  You're not installed Homebrew already."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      echo "🏆 Homebrew installed successfully!"
    else
      echo "👍 Homebrew already installed!"
    fi
    echo ""
    echo "-------------------------------------------------------"
  
    packages=(
      "zsh"
      "tmux"
      "git"
      "node"
      "python3"
      "ctags"
    )
  
    # Installing packages
    for i in "${packages[@]}"; do
      echo ""
      echo "Installing ${i} ......"
      if ! [ -f "/usr/local/bin/${i}" ]; then
        echo "⚠️  You're not installed ${i} already."
        brew install $i
        echo "🏆 ${i} installed successfully!"
      else
        echo "👍 ${i} already installed!"
      fi
      echo ""
      echo "-------------------------------------------------------"
    done
  
    # Installing neovim
    echo ""
    echo "Installing neovim ......"
    if ! [ -f "/usr/local/bin/nvim" ]; then
      echo "⚠️  You're not installed neovim already."
      brew install neovim
      echo "🏆 Neovim installed successfully!"
    else
      echo "👍 Neovim already installed!"
    fi
    echo ""
    echo "-------------------------------------------------------"
  fi
  
  # Installing oh my zsh
  echo ""
  echo "Installing oh-my-zsh ......"
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "⚠️  You're not installed oh-my-zsh already."
    {
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    } || {
      echo ""
    }
    echo "🏆 oh-my-zsh installed successfully!"
  else
    echo "👍 oh-my-zsh already installed!"
  fi
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing powerlevel9k
  echo ""
  echo "Installing powerlevel9k theme ......"
  if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel9k" ]; then
    echo "⚠️  You're not installed powerlevel9k already."
    git clone https://github.com/Powerlevel9k/powerlevel9k.git $HOME/.oh-my-zsh/custom/themes/powerlevel9k
    echo "🏆 Powerlevel9k installed successfully!"
  else
    echo "👍 Powerlevel9k already installed!"
  fi
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing oh my tmux
  echo ""
  echo "Installing oh-my-tmux ......"
  if [ ! -d $HOME"/.tmux" ]; then
    echo "⚠️  You're not installed oh-my-tmux already."
    git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
    ln -s -f $HOME/.tmux/.tmux.conf
    cp $HOME/.tmux/.tmux.conf $HOME
    echo "🏆 oh-my-tmux installed successfully!"
  else
    echo "👍 oh-my-tmux already installed!"
  fi
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing zsh plugins
  echo ""
  echo "Installing zsh plugins ......"
  echo ""
  rm -rf $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  echo ""
  rm -rf $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  echo "🏆 Plugins installed successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing pip3 neovim client
  echo ""
  echo "Installing Python Neovim client ......"
  pip3 install neovim
  echo "🏆 Python Neovim installed successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing node neovim package
  echo ""
  echo "Installing Node Neovim package ......"
  npm install -g neovim
  echo "🏆 Python Neovim installed successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Copy .zshrc
  echo ""
  echo "Copying .zshrc into home directory......"
  if [ -f $HOME"/.zshrc" ]; then
    rm $HOME/.zshrc
  fi
  cp .zshrc $HOME/
  echo "🏆 Copy .zshrc to home directory successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Copy .tmux.conf.local
  echo ""
  echo "Copying .tmux.conf.local into home directory ......"
  if [ -f $HOME"/.tmux.conf.local" ]; then
    rm $HOME/.tmux.conf.local
  fi
  cp .tmux.conf.local $HOME/
  echo "🏆 Copy .tmux.conf.local to home directory successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Sourcing .tmux.conf
  echo ""
  echo "Sourcing .tmux.conf ......."
  tmux source $HOME/.tmux.conf
  echo "🏆 Sourced .tmux.conf successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Copy neovim config
  echo ""
  echo "Copying init.vim into ~/.config/nvim/init.vim"
  if [ -f $HOME"/.config/nvim/init.vim" ]; then
    rm $HOME/.config/nvim/init.vim
  fi
  if [ ! -d $HOME"/.config" ]; then
    mkdir $HOME/.config
  fi
  if [ ! -d $HOME"/.config/nvim" ]; then
    mkdir $HOME/.config/nvim
  fi
  cp .config/nvim/init.vim $HOME/.config/nvim/init.vim
  echo "🏆 Copy init.vim to ~/.config/nvim/init.vim successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Change default sh to zsh
  echo ""
  echo "Changing default shell to zsh ......"
  sudo chsh -s /usr/local/bin/zsh
  echo "🏆 Default shell change to zsh successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing vim plug
  echo ""
  echo "Installing vim plug ......"
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "🏆 Vim plug installed successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Neovim plug install
  echo ""
  echo "Installing Neovim's plugins ......"
  /usr/local/bin/nvim -c "PlugInstall"
  echo "🏆 Neovim's plugins installed successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  # Installing Coc dependencies
  echo ""
  echo "Installing Coc's dependencies ......"
  coc_dependencies=(
    "python"
    "phpls"
    "tsserver"
    "json"
    "eslint"
    "prettier"
    "vetur"
    "html"
    "css"
  )
  for i in "${packages[@]}"; do
    /usr/local/bin/nvim +"CocInstall ${i}"
  done
  echo "🏆 Coc's plugins installed successfully!"
  echo ""
  echo "-------------------------------------------------------"
  
  
  echo ""
  echo "*******************************************************"
  echo "*                                                     *"
  echo "*  🍺🍺🍺 Congratulations! Installed successfully!    *"
  echo "*  Please relaunch iterm2!                            *"
  echo "*                                                     *"
  echo "*******************************************************"
  exit 0
} || {
  echo "❌  Something went wrong."
  echo "Please retry or fix the errors."
  exit 0
}
