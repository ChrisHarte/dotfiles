## OSX Tips

### Take screenshots

    Command + Shift + 3  (full screen)
    Command + Shift + 4  (selective)

Install something like (Orbit)[http://orbitapp.net/] to send your screenshots automatically to the web.

### Take measurements

    Command + Shift + 4 then use the mouse to click-and-drag to see dimensions then ESC to avoid taking a screenshot.

### OSX Terminal

    ctrl + shift [  back one tab
    ctrl + shift ]  forward one tab

## OSX Fixes (mountain lion)

### 'default' POW symlink

To make your host address point to a specific POW instance rather than the standard pow error message
create a symlink in your ~/.pow directory called 'default' that points to your chosen app directory.

That way when your open virtualbox and point to your machine's ip address it will goto that app instead.

    ln -s ~/projects/myapp ~/.pow/default

### Use another mac as a second monitor (target display mode)

1. Connect your macbook to the external display (imac) via thunderbolt cable
2. On the iMac press Command+F2, this will reset the display and have the Macbook take over the iMac as a second monitor.

### ImageMagick Install on OSX (MiniMagick is recommended for rails)

    brew install imagemagick jpeg libtiff jasper

https://coderwall.com/p/wnomjg

### ImageMagick fix #1 for OSX

    cd /usr/local/Cellar/imagemagick/6.8.0-10/lib
    ln -s libMagick++-Q16.7.dylib   libMagick++.dylib
    ln -s libMagickCore-Q16.7.dylib libMagickCore.dylib
    ln -s libMagickWand-Q16.7.dylib libMagickWand.dylib

    brew uninstall libtool
    brew install --fresh libtool
    brew link libtool
    brew cleanup

### ImageMagick fix #2 for OSX

    brew uninstall imagemagick
    brew cleanup --force -s
    brew install imagemagick

### Copy ISO to USB Stick

    diskutil list
    diskutil unmountDisk /dev/disk1
    sudo dd if=ubuntu-12.04.1-server-amd64.iso of=/dev/disk1 bs=8m
    diskutil eject /dev/disk1
