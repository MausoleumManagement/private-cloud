2026.04.10

## Symptoms
- api-server could not reach any webhook endpoints, threw tons of errors (timeouts)
- stuff relying on webhooks was not working (e.g. cert-manager) 
- starting a debug pod showed, that the webhook endpoints could be reached successfully

## Resolution
- restarting the cilium agent Daemonset fixed the issue

## Explanation (Attempt)
- Regular pods and hostNetwork pods (like the api-server pods) get treated differently by cilium
  - The regular pod's pathway was working fine, but the networking for hostNetwork pods was broken