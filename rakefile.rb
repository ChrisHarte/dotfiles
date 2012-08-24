#!/usr/bin/env ruby

task :default do
  # symlink configs
  system("ln -s ~/.dotfiles/.gemrc ~/.gemrc")
  system("ln -s ~/.dotfiles/.gitconfig ~/.gitconfig")
  system("ln -s ~/.dotfiles/.githelpers ~/.githelpers")
  system("ln -s ~/.dotfiles/.gitignore ~/.gitignore")
  system("ln -s ~/.dotfiles/.powconfig ~/.powconfig")
  system("ln -s ~/.dotfiles/.pryrc ~/.pryrc")
  system("ln -s ~/.dotfiles/.zshrc ~/.zshrc")
  system("ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf")

  # for the mongo database
  system("mkdir ~/.dotfiles/local_db")
  system("ln -s ~/.dotfiles/.bundle_config ~/.bundle/config")
end

task :install do
  # install vim from homebrew
  system("brew install --HEAD https://raw.github.com/Homebrew/homebrew-dupes/master/vim.rb")

  # test vim has ruby support
  system("vim --version | grep ruby")

  # install tmux
  system("brew install tmux")
end

task :drive_to_pictures do
  # symlink Pictures to google drive
  # prerequisites: install google drive & sync it!

  system("sudo rm ~/Pictures") # remove Pictures dir
  system("ln -s Google\ Drive/pictures Pictures") # symlink new Pictures dir to google drive
end
