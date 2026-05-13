# Q11: Gateway API

You have an existing web application deployed using an Ingress resource named `web`. You must migrate the existing Ingress configuration to the **Kubernetes Gateway API**, maintaining the existing HTTPS access configuration.

## Task

1. Create a **Gateway** resource named `web-gateway`:
   - Hostname: `gateway.web.k8s.local`
   - Maintain the existing TLS and listener configuration from the `web` Ingress

2. Create a **HTTPRoute** resource named `web-route`:
   - Hostname: `gateway.web.k8s.local`
   - Maintain the existing routing rules from the `web` Ingress

> ℹ️ A GatewayClass named `nginx-class` is already installed in the cluster.

## Useful commands

```bash
kubectl get ingress web -o yaml
kubectl get gatewayclass
kubectl api-resources | grep gateway
```

🎬 Video walkthrough: https://youtu.be/G9zispvOCHE

---
*Click **Check** to validate, or type `hint` for solution notes.*
