# Git

## Status & history

git status
git log --oneline
git log --oneline --graph --decorate
git diff
git diff --staged

## Branches

git branch
git branch -a
git switch main
git switch -c feature/name
git branch -d branch-name

## Remote

git fetch
git pull
git push
git remote -v

## Commit

git add .
git commit -m "message"
git commit --amend

## Stash

git stash
git stash pop
git stash list
git stash drop

## Rebase

git fetch origin
git rebase origin/main

## Undo

git restore file
git restore --staged file
git reset --soft HEAD~1
git reset --hard HEAD~1

## Remote branch

git push -u origin branch-name

## Force push safely

git push --force-with-lease
