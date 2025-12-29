## Cilium
Until we have improved the ugly JSON

```bash
detect-undead config cilium | yq 'select(.metadata.name == "cilium-envoy-config") | .data."bootstrap-config.json"' | jq
```

