#!/bin/bash

set -euo pipefail

curl \
    https://raw.githubusercontent.com/cloudnative-pg/artifacts/refs/heads/main/image-catalogs/catalog-standard-trixie.yaml \
    -o components/cnpg-operator/catalog-standard-trixie.yaml
