CNPG offers different image classes:

- `minimal` images are meant be close to the debian based postgresql images. They come with no additional extensions
- `standard` images are derived from `minimal` ones and contain some additional extensions by default
- `system` images which have barman built in, but are not recommended for use anymore

There's all kinds of funny tags one can use to reference the container images.

- https://github.com/cloudnative-pg/postgres-containers
- https://github.com/cloudnative-pg/postgres-containers/pkgs/container/postgresql
- https://github.com/cloudnative-pg/postgres-containers/pkgs/container/postgresql/versions?filters%5Bversion_type%5D=tagged

e.g.
```
docker pull ghcr.io/cloudnative-pg/postgresql:17.6-standard-trixie
```

## Image Catalogs

[(Cluster)ImageCatalogs](https://cloudnative-pg.io/documentation/current/image_catalog/) can be namespaced or cluster wide. Either way, they need to be referenced by the cnpg cluster CRD, to override that cluster's container images.

- https://github.com/cloudnative-pg/artifacts/tree/main/image-catalogs
