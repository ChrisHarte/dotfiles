# GIT

## TIG (text-mode interface for git)

    brew install tig

https://github.com/jonas/tig

## Rebase

Filters are included to help with rebasing using http://technosorcery.net/blog/2010/02/07/fun-with-the-upcoming-1-7-release-of-git-rebase---interactive---autosquash/

Basically for any commit you are doing that you know you will want to squash, put 'squash!' at the beginning of the commit.

Now when you go to rebase,

    git ri <branch-name>

It will use those comments to mark them as 'squash'able automatically, any others will be marked with pick as usual.

Note, if you exit out of the editor (in this case vim) without saving git will still try to perform the rebase to revert this do:

    git reset --soft

You'll now be ready to redo the rebase.

### Abort

If you screw up the rebase and need to abort the rebase do:

    git rebase --abort

### play-by-play

When you do do a rebase, here's how it goes:

1. First you perform the rebase, specifying the ref and branch.

    **git ri origin/master** or **git rebase origin/master --interactive**

2. Next git will open your editor of choice specified from .gitconfig, in this vim
3. You will now see a list of your local commits, in ascending order (first to last).
4. All will be marked with the 'pick' command, change as appropriate.
6. Save and quit ":wq!"
7. VIM will re-open and you'll now see all the commit messages from the squashed commits.
8. Save and quit again ":wq!"
9. You should finally see this message confirming the rebase has gone correctly,

    **Successfully rebased and updated refs/heads/master.**

10. You still need to push your changes

    **git push origin master**

Note: because of the [default=nothing] setting in .gitconfig, you will always have to specify the ref to push with rather than use the default. it's safer this way http://technosorcery.net/blog/2011/12/15/making-git-push-a-little-smarter-slash-safer/

### rebase commands

    p, pick = use commit
    r, reword = use commit, but edit the commit message
    e, edit = use commit, but stop for amending
    s, squash = use commit, but meld into previous commit
    f, fixup = like "squash", but discard this commit's log message
    x, exec = run command (the rest of the line) using shell

## Notes

### git r
show current branch history

### git ra
show all history

### git push --set-upstream origin <branch-name>
*--set-upstream* sets what ref we'll be pushing to so we don't have to specify every time.
This won't have any effect as we've used [default=nothing] in our .gitconfig so we'll have to specify the ref on each push.

### git pull --rebase
Doing 'git pull' is fine but if you're working on a branch others are actively using this will add a merge message to the log messing up the log history. Using --rebase will do a pull then rebase and keep the log clean.

### git stash
Stash your un-committed changes

### git stash pop
Restore your stashed changes

### git stash list
List all stashed changes

### git stash pop[1]
Restore stashed change at location 1

### git merge --ff-only
Refuse to merge and exit with a non-zero status unless the current HEAD is already up-to-date or the merge can be resolved as a fast-forward.

### git branch -d <branch-name>
Delete local branch

### git push origin --delete <branch-name>
Delete remote branch

### git ri <branch-name>
Start interactive rebase

### git rebase --abort
Abort rebase

### git reset --soft
Does not touch the index file nor the working tree at all (but resets the head to <commit>, just like all modes do). This leaves all your changed files "Changes to be committed", as git status would put it.

### git reset --hard
Resets the index and working tree. Any changes to tracked files in the working tree since <commit> are discarded.

### git reset --hard HEAD~3
Rewind branch 3 commits back, destroying those commits

### git grep [search term]
Search committed code in a git repo http://stackoverflow.com/questions/2928584/how-to-grep-search-committed-code-in-the-git-history

### git blame [file]
See commit history for file.

### git branch -a
See both local and remote branches

### git branch -l
See local branches

### git branch -r
See remote branches

## Fetching remote branches

    git fetch origin [branch]
    git co [branch]

## Tracking remote branches

    git fetch
    git branch -a
    git branch --track new-feature origin/new-feature
    git co new-feature

## Create a new Branch based on the current commit

    git co -b [new-branch-name]

## Links

http://stackoverflow.com/questions/4114095/git-revert-to-previous-commit-how

## Amend a commit

    git commit -m 'initial commit'
    git add forgotten_file
    git commit --amend

or

    git co HEAD~1
    git commit -m 'forgotten file'
    git push origin branch-name --force
