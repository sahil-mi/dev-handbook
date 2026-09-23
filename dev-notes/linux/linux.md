# Linux

## Navigation

```bash
pwd
ls
ls -la
cd /path/to/dir
cd ..
cd ~
cd -
```

## Files & directories

```bash
touch file.txt
mkdir dir
mkdir -p a/b/c
cp file.txt copy.txt
cp -r dir/ backup/
mv old.txt new.txt
rm file.txt
rm -r dir/
```

`rm -r` has no undo. Check the path first.

## View files

```bash
cat file.txt
less file.txt
head -n 20 file.txt
tail -n 20 file.txt
tail -f app.log
```

## Search

```bash
grep 'text' file.txt
grep -rn 'text' .
grep -i 'text' file.txt
find . -name '*.md'
find . -type f -mtime -1
```

## Pipes & redirection

```bash
ls | grep '.md'
cat file.txt | wc -l
command > out.txt
command >> out.txt
command 2> errors.txt
command > out.txt 2>&1
```

`>` overwrites, `>>` appends.

## Permissions

```bash
ls -l
chmod +x script.sh
chmod 644 file.txt
chmod 755 dir/
chown user:group file.txt
```

| Number | Meaning |
|---|---|
| 7 | read + write + execute |
| 6 | read + write |
| 5 | read + execute |
| 4 | read |

## Processes

```bash
ps aux
ps aux | grep node
top
htop
kill PID
kill -9 PID
pkill node
```

Try `kill` before `kill -9`.

## Ports

```bash
ss -tulpn
ss -tulpn | grep 3000
lsof -i :3000
```

## Disk & memory

```bash
df -h
du -sh *
du -sh dir/
free -h
```

## Archives

```bash
tar -czf archive.tar.gz dir/
tar -xzf archive.tar.gz
zip -r archive.zip dir/
unzip archive.zip
```

## Packages (Ubuntu/Debian)

```bash
sudo apt update
sudo apt upgrade
sudo apt install package-name
sudo apt remove package-name
apt search package-name
```

## Services

```bash
systemctl status nginx
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl enable nginx
journalctl -u nginx -f
```

## Environment

```bash
echo $PATH
env
export NODE_ENV=development
which node
```

Add `export` lines to `~/.zshrc` or `~/.bashrc` to keep them.

## History & shortcuts

```bash
history
!!
sudo !!
```

| Shortcut | Action |
|---|---|
| `Ctrl+R` | search history |
| `Ctrl+C` | cancel command |
| `Ctrl+L` | clear screen |
| `Ctrl+A` | start of line |
| `Ctrl+E` | end of line |
