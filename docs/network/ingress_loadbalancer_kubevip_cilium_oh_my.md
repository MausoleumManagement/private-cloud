
Underneath [the big table of supported annotations](https://docs.cilium.io/en/stable/network/servicemesh/ingress/#supported-ingress-annotations), the cilium docs also mention, that the ingress controller can copy annotations from the ingress resource to the LoadBalancer service resource. Which one those are is determined by prefixes defined in the `ingressController.ingressLBAnnotationPrefixes` of the cilium helm chart.


```
            ┌────┐                                                             
            │node│                                                             
            └────┘                                                             
              ▲                                                                
              │ announces IP on                                                
         ┌────┴───┐                                                            
         │kube-vip│                                                            
         └────┬───┘                                                            
              │                                                                
              │ reads IP from                                                  
              │                                                                
              ▼                                                                
     ┌─────────────────┐          assigns IP to       ┌───────────────────────┐
     │ services of type│ ◄────────────────────────────┤kube-vip-cloud-provider│
     │   LoadBalancer  │                              └───────────┬───────────┘
     └─────────────────┘                                          │            
              ▲                                                   │ reads      
              │ creates, based on                                 │            
              │ Ingress                                           ▼            
              │                                       ┌───────────────────────┐
┌─────────────┴─────────────┐                         │    kubevip ConfigMap  │
│cilium (ingress controller)│                         │(kube-system namespace)│
└─────────────┬─────────────┘                         │                       │
              │                                       └───────────┬───────────┘
              │ watches for                                       │            
              │                                                   │ contains   
              │                                                   │            
              ▼                                                   ▼            
         ┌─────────┐                                  ┌───────────────────────┐
         │Ingresses│                                  │IP-ranges to be used by│
         └─────────┘                                  │kube-vip-cloud-provider│
                                                      └───────────────────────┘
```
