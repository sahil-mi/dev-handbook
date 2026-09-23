# SSH

## Connect

```bash
ssh user@host
```

## Key

```bash
ssh -i ~/.ssh/id_ed25519 user@host
```

## Generate

```bash
ssh-keygen -t ed25519
```

## Config

File:

```text
~/.ssh/config
```

Example:

```text
Host myserver
  HostName example.com
  User deploy
  IdentityFile ~/.ssh/id_ed25519
```

Then:

```bash
ssh myserver
```

## Copy files

```bash
scp file.txt user@host:/path/
scp user@host:/path/file.txt .
```

## Port forwarding

```bash
ssh -L 8080:localhost:3000 user@host
```

## Security

Never share private keys.
