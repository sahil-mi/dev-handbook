# jq

## Pretty print

```bash
echo '{"name":"Sam"}' | jq
```

## Property

```bash
echo '{"name":"Sam"}' | jq '.name'
```

## Array

```bash
echo '[{"id":1},{"id":2}]' | jq '.[].id'
```

## Filter

```bash
jq '.users[] | select(.active == true)'
```

## Transform

```bash
jq '.users | map(.email)'
```

## curl + jq

```bash
curl -s https://api.example.com/users | jq '.[] | .name'
```

## Raw output

```bash
jq -r '.name'
```
