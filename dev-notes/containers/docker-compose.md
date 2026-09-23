# Docker Compose

## Start

```bash
docker compose up
docker compose up -d
```

## Stop

```bash
docker compose down
```

## Rebuild

```bash
docker compose up --build
```

## Logs

```bash
docker compose logs
docker compose logs -f app
```

## Status

```bash
docker compose ps
```

## Shell

```bash
docker compose exec app sh
```

## Example

```yaml
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      NODE_ENV: development
```

Keep secrets out of committed Compose files when appropriate.

