## Ad Hoc DB Backup

The superuser is not permitted to be used remotely by default, but we don't need it for the purpose of taking db backups.

Port forward to DB service
```bash
k -n openbao port-forward  service/cnpg-openbao-rw 5432:5432
```

Get password for DB
```bash
k -n openbao get secret cnpg-openbao-app-user -o jsonpath='{.data.password}' | base64 -d
psql -p 5432 -h localhost -U openbao
```

Take a custom dump and a plain dump, if desired.

```bash
pg_dump -F custom -p 5432 -h localhost -U openbao openbao > /wunderhort/passwoerter/openbao_custom.dump
pg_dump -F plain -p 5432 -h localhost -U openbao openbao > /wunderhort/passwoerter/openbao_plain.sql
```
