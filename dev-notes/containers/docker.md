# Docker

## Images

```bash
docker images
docker pull nginx
docker build -t my-app .
```

## Containers

```bash
docker ps
docker ps -a
docker run nginx
docker run -d --name web nginx
docker stop web
docker start web
docker rm web
```

## Logs

```bash
docker logs web
docker logs -f web
```

## Shell

```bash
docker exec -it web sh
```

## Ports

```bash
docker run -p 8080:80 nginx
```

Host `8080` → container `80`.

## Environment

```bash
docker run -e NODE_ENV=production my-app
```

## Cleanup

```bash
docker container prune
docker image prune
```

Use prune commands carefully.
