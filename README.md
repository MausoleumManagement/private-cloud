## Renovate
The renovate configuration can be validated as described [here](https://docs.renovatebot.com/config-validation/). A [custom manager](https://docs.renovatebot.com/modules/manager/regex/) is used to handle the provider generation script.


## Cert Manager
This repository contains the files necessary to install cert-manager.

- See [here](https://cert-manager.io/docs/) for the documentation
- See [here](https://artifacthub.io/packages/helm/cert-manager/cert-manager) for the releases
- See [here](https://github.com/cert-manager/cert-manager) for the code

## Cilium
Until we have improved the ugly JSON

```bash
detect-undead config cilium | yq 'select(.metadata.name == "cilium-envoy-config") | .data."bootstrap-config.json"' | jq
```

## ArgoCD

### Upgrading and How the Helm Chart Relates to the Deployment Method in the Docs 

The official quickstart instructions instructions [here](https://argo-cd.readthedocs.io/en/stable/getting_started/) work by just downloading a bunch of resources and applying them on the cluster. These resources are generated using kustomize for each release. The helm chart developers say that they want to be as close as possible to this in their [notes on upgrading the helmchart](https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd#synchronizing-changes-from-original-repository).
