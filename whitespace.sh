#!/bin/sh
#
# A git hook script to find and fix trailing whitespace
# in your commits. Bypass it with the --no-verify option
# to git-commit
#
# http://stackoverflow.com/questions/591923/make-git-automatically-remove-trailing-whitespace-before-committing

if git-rev-parse --verify HEAD >/dev/null 2>&1 ; then
  against=HEAD
else
  # Initial commit: diff against an empty tree object
  against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi
# Find files with trailing whitespace
for FILE in `exec git diff-index --check --cached $against -- | sed '/^[+-]/d' | (sed -r 's/:[0-9]+:.*//' > /dev/null 2>&1 || sed -E 's/:[0-9]+:.*//') | uniq` ; do
  # Fix them!
  (sed -i 's/[[:space:]]*$//' "$FILE" > /dev/null 2>&1 || sed -i '' -E 's/[[:space:]]*$//' "$FILE")
  git add "$FILE"
done

# Now we can commit
exit
