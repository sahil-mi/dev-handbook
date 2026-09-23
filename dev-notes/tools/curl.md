# curl

## GET

```bash
curl https://api.example.com/users
```

## Headers

```bash
curl -H 'Authorization: Bearer TOKEN'   https://api.example.com/users
```

Don't put real tokens in notes.

## POST JSON

```bash
curl -X POST https://api.example.com/users   -H 'Content-Type: application/json'   -d '{"name":"Sam"}'
```

## Verbose

```bash
curl -v https://example.com
```

## Headers only

```bash
curl -I https://example.com
```

## Redirects

```bash
curl -L https://example.com
```

## Save response

```bash
curl -o response.json https://api.example.com/data
```

## Timing

```bash
curl -w '\n%{http_code} %{time_total}\n' -o /dev/null -s https://example.com
```
