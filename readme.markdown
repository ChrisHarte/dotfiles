## Install

    git clone git@github.com:johnantoni/dotfiles.git ~/.dotfiles

## VirtualBox

 install virtualbox with ie7,8,9 (admin password=Password1)

    installie789 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
    installie7 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="7" bash
    installie8 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="8" bash
    installie9 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash

## Install Libv8 on OSX 10.8

    RUBYOPT=-rrubygems bundle install

## Create Sublime Text command-line shortcut "subl ."

    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/.dotfiles/bin/subl
