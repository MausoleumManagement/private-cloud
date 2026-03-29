
### Storing Values
Storing secrets under an entry works by passing them as `key=value` pairs
```bash
bao kv put -mount=kv nekropolis/example-entry abc=123
```

Multiple values can be stored under an entry. `put` overwrites  the entry with only the secrets specified remaining

```bash
bao kv put -mount=kv nekropolis/example-entry uvw=111 xyz=789
```

### Retrieving Values

List entries
```bash
bao kv list -mount=kv nekropolis/
```

Retrieve secret values
```bash
bao kv get -mount=kv nekropolis/example-entry
```

We can then make sure we got everything right by getting only that specific value
```bash
bao kv get -mount=kv -field=auth.yml nekropolis/victoria-logs/vmauth-secret
```

### Multiline Values
Instead of passing values on the commandline, files can be read via the `@`-operator. This is particularly neat for multiline secrets
```bash
bao kv put -mount=kv nekropolis/victoria-logs/vmauth-secret auth.yml=@components/victoria-logs/vmauth-secret_template.yaml
```

See the [section on retrieving values](###retrieving-values) for how to fetch only a specific value in case we want to locally edit and then change it.


### Modifying specific values in a secret
`patch` leaves the unspecified secrets as they are, and modifies the specified values.

```bash
bao kv patch -mount=kv nekropolis/example-entry abc=123 def=456
```

### Deleting Entries
```bash
bao kv delete -mount=kv nekropolis/example-entry
```
