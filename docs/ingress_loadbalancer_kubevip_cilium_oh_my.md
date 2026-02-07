

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
