# Git

## Status & history

```bash
git status
git log --oneline
git log --oneline --graph --decorate
git diff
git diff --staged
```

## Branches

```bash
git branch
git branch -a
git switch main
git switch -c feature/name
git branch -d branch-name
```

## Remote

```bash
git fetch
git pull
git push
git remote -v
```

## Commit

```bash
git add .
git commit -m "message"
git commit --amend
```

## Stash

```bash
git stash
git stash pop
git stash list
git stash drop
```

## Rebase

```bash
git fetch origin
git rebase origin/main
```

## Undo

```bash
git restore file
git restore --staged file
git reset --soft HEAD~1
git reset --hard HEAD~1
```

## Remote branch

```bash
git push -u origin branch-name
```

## Force push safely

```bash
git push --force-with-lease
```
