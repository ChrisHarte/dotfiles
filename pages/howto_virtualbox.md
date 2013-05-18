# VirtualBox

 install virtualbox with ie7,8,9 (admin password=Password1)

    installie789 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
    installie7 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="7" bash
    installie8 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="8" bash
    installie9 => curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | IEVMS_VERSIONS="9" bash

## Windows 7

Windows 7 requires at least 5.88 GB disk space to install, any lower and it will refuse to install.

Also Windows 7 does not play nicely with dual boot hard disks (e.g. one for linux / one for windows) and will want to install on the bigger drive regardless. Best option there is to disconnect to Linux drive before you install Windows.
