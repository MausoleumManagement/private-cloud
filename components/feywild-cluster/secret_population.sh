#!/bin/bash

clouds_yaml=$(base64 --wrap 0 clouds.yaml)
api_cert=$(openssl s_client -showcerts -servername prod3.api.pco.get-cloud.io -connect prod3.api.pco.get-cloud.io:5000 </dev/null 2>/dev/null | base64 --wrap 0)

bao kv put -mount=kv nekropolis/cluster-api/feywild-cluster-credentials clouds_yaml=@<(echo $clouds_yaml) api_cert=@<(echo $api_cert)
