# DNS

## Records

| Type | Purpose |
|---|---|
| A | hostname → IPv4 |
| AAAA | hostname → IPv6 |
| CNAME | hostname → hostname |
| MX | mail routing |
| TXT | verification/policy |
| NS | authoritative nameservers |
| SRV | service discovery |

## Lookup

```bash
dig example.com
dig A example.com
dig MX example.com
dig TXT example.com
nslookup example.com
```

## Troubleshooting

Check:
1. authoritative nameservers
2. record name
3. record value
4. TTL
5. propagation

Changing MX records can affect inbound email.
