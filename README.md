## So What Is This Anyway?

This repository contains the manifests for the infrastructure services of my kubernetes cluster undeder [manifests/](manifests/) and the kustomize files required to generate them under [components/](components/).


## Further reading

The [documentation](docs/) is still WIP, as you can tell, but i've wrotten some articles on my blog about this project: [[1](https://lichturm.de/en/posts/pve_k8s_considerations/),[2](https://lichturm.de/de/posts/pve_k8s_image-builder/),[3](https://lichturm.de/de/posts/pve_k8s_capi_testrun/)]. If you want to get a better idea, i think the [official documentation](https://cluster-api.sigs.k8s.io/user/concepts) of Cluster API will serve you better than most things i could write.
The idea is to have a fully declarative setup that can be published without too much to think about.


## Renovate

To help with keeping all the depencencies up to date, renovate is used to automate the release note retrieval and MR creation process.

The renovate configuration can be validated as described [here](https://docs.renovatebot.com/config-validation/). A [custom manager](https://docs.renovatebot.com/modules/manager/regex/) is used to handle the provider generation script.
