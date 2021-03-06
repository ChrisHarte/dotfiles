#!/usr/bin/env ruby

# Default install
task :default do
  # remove original configs
  system("rm ~/.zshrc")

  # create .vim dir
  system("mkdir ~/.vim")

  # create tmp dir
  system("mkdir ~/.tmp")

  # configs
  system("ln -s ~/.dotfiles/.gemrc ~/.gemrc")
  system("ln -s ~/.dotfiles/.gitconfig ~/.gitconfig")
  system("ln -s ~/.dotfiles/.githelpers ~/.githelpers")
  system("ln -s ~/.dotfiles/.gitignore ~/.gitignore")
  system("ln -s ~/.dotfiles/.powconfig ~/.powconfig")
  system("ln -s ~/.dotfiles/.pryrc ~/.pryrc")
  system("ln -s ~/.dotfiles/.zshrc ~/.zshrc")
  system("ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf")
  system("ln -s ~/.dotfiles/.irbrc ~/.irbrc")
  system("ln -s ~/.dotfiles/.vimrc ~/.vimrc")
  system("ln -s ~/.dotfiles/.rspec ~/.rspec")
  system("ln -s ~/.dotfiles/.agignore ~/.agignore")
  system("ln -s ~/.dotfiles/.tigrc ~/.tigrc")
  system("ln -s ~/.dotfiles/.rdebugrc ~/.rdebugrc")

  # make terminal faster
  system("touch ~/.hushlogin")

  # install 91 command set
  system("git clone git@github.com:johnantoni/91.git ~/.91")

  # bundler config
  system("mkdir ~/.bundle")
  system("ln -s ~/.dotfiles/.bundle ~/.bundle/config")

  Rake::Task["update"].invoke
  Rake::Task["security_patch"].invoke
end

# Update plugins
task :update do
  system("git pull && git submodule init && git submodule update && git submodule status")
end

# Install Powerline ZSH Theme
# https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme
task :zsh_powerline do
  system("ln -f ~/.dotfiles/zsh/powerline.zsh-theme ~/.oh-my-zsh/themes/powerline.zsh-theme")
  system("ln -f ~/.dotfiles/zsh/agnoster-light.zsh-theme ~/.oh-my-zsh/themes/agnoster-light.zsh-theme")
end

# Install Rbenv
task :rbenv do
  system("cd ~ && git clone git://github.com/sstephenson/rbenv.git .rbenv")
  system("cd ~ && git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build")
  system("mkdir -p ~/.rbenv/plugins && cd ~/.rbenv/plugins && git clone https://github.com/sstephenson/rbenv-vars.git")
end

# Install support for OSX
task :osx do
  system("brew install --HEAD https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb") # vim
  system("vim --version | grep ruby") # test ruby support
  system("brew install tmux") # install tmux
  system("brew install reattach-to-user-namespace") # install copy&paste fix
end

# Symlink Pictures to Google Drive
task :link_pictures do
  system("sudo rm ~/Pictures") # remove Pictures dir
  system("ln -s Google\ Drive/pictures Pictures") # symlink new Pictures dir to google drive
end

# Compaudit on Linux
task :security_patch do
  system("chmod -R 755 ~/.dotfiles/zsh")
end
