
# Reading Material

- https://docs.cilium.io/en/stable/network/servicemesh/gateway-api/gateway-api/
- https://docs.cilium.io/en/stable/network/servicemesh/gateway-api/gateway-api/#examples

# Fun and Games with the Gateway API

## KubeProxy Replacement

### What Kubeproxy normally does

Kube-proxy implements Kubernetes Service abstraction by programming iptables or IPVS rules that route traffic from Service ClusterIPs to backend Pod endpoints. It watches the Kubernetes API for Service and Endpoints changes and updates the node's networking rules accordingly.

### How Cilium replaces it

Cilium uses eBPF programs loaded directly into the Linux kernel to handle Service load balancing, completely bypassing iptables and kube-proxy. These eBPF programs intercept packets at the socket and network device level, which means we get to do funny network magic before the whole TCP/IP stack happens (which is quicker).

### Why

eBPF-based load balancing has better performance with lower latency and CPU overhead compared to iptables. It also enables neat features like Maglev consistent hashing, DSR (Direct Server Return), and better observability through Hubble.

## Cert Manager
By enabling Gateway API support in Cert Manager, we can get automatically issued certificates for our `Gateway`s and `HTTPRoute`s, which is what the Gateway API uses to route traffic. Pretty much like `Gateways` and `VirtualServices` in Istio.
