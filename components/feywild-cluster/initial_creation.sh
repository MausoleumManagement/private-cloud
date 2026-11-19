#!/bin/bash

export KUBECONFIG=~/.kube/config

. creation.env
. creation.secrets

#clusterctl generate cluster --infrastructure openstack:v0.14.6 feywild --list-variables

# we remove the required network-ID, because even though network-IDs can't be used for pwning us directly
# i still think less is more here... instead, we filter for the generic external network
# then split manifests into separate files and disambiguate by name
clusterctl generate cluster --infrastructure openstack:v0.15.1 feywild  | \
        yq '(select(.kind == "OpenStackCluster") | .spec.externalNetwork) = {"filter": {"name": "ext01"}}' | \
	yq -s '(.kind | downcase) + "-" + .metadata.name + ".yaml"'

#yq -i '(select(.kind == "OpenStackCluster") | .spec.externalNetwork) = {"filter": {"name": "ext01"}}' cluster-feywild.yaml
