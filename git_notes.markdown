# GIT NOTES

## do a git pull, remote changes override local changes

    git fetch origin
    git reset --hard origin

## simpler rebases

http://technosorcery.net/blog/2010/02/07/fun-with-the-upcoming-1-7-release-of-git-rebase---interactive---autosquash/

using the aliases below allows you to mark commits ahead of time for
which ones you want to squash on a rebase.

so:

    git commit -am 'squash! Change all the "Bar"s'
    git commit -am 'squash! Change all the "Foos"s'

then

    git ri origin/master

    origin = remote
    master = branch

will give you:

    pick 8374d8e Change all the "Bar"s to "Foo"s
    fixup cfc6e54 fixup! Change all the "Bar"s
    pick 2d12ce8 Change all the "Foo"s to "Bar"s
    
    # Rebase b6bee12..cfc6e54 onto b6bee12
    #
    # Commands:
    #  p, pick = use commit
    #  r, reword = use commit, but edit the commit message
    #  e, edit = use commit, but stop for amending
    #  s, squash = use commit, but meld into previous commit
    #  f, fixup = like "squash", but discard this commit's log message
    #
    # If you remove a line here THAT COMMIT WILL BE LOST.
    # However, if you remove everything, the rebase will be aborted.
    #

and the alias:

    [alias]
      fixup = !sh -c 'git commit --fixup=$1' -
      squash = !sh -c 'git commit --squash=$1' -
      ri = rebase --interactive --autosquash

## Articles

http://technosorcery.net/blog/2011/12/15/making-git-push-a-little-smarter-slash-safer/
http://codeinthehole.com/writing/tips-for-using-a-git-pre-commit-hook/
http://stackoverflow.com/questions/591923/make-git-automatically-remove-trailing-whitespace-before-committing
http://stackoverflow.com/questions/101752/aborting-a-merge-in-git

