# disable / enable spotlight

    alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
    alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
    alias spothide="sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"
    alias spotshow="sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search && killall SystemUIServer"

# mirror site

    wget -m -k -K -E $@

# nginx

    sudo service nginx $@

# custom color settings

    " highlight the status line
    hi StatusLine ctermfg=blue ctermbg=yellow

    " Set gutter background to black
    hi SignColumn ctermbg=white

    " make the omnicomplete text readable
    hi Pmenu ctermbg=238 gui=bold

    " autocomplete
    hi Search ctermbg=156 ctermfg=16

    " vertical line color
    hi CursorColumn ctermbg=16

    " horizontal line color
    hi CursorLine cterm=NONE ctermbg=white
