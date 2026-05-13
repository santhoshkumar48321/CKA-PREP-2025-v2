# Q17: TLS Config

There is an existing deployment in the `nginx-static` namespace. The deployment contains a ConfigMap that currently supports `TLSv1.2` and `TLSv1.3`, as well as a Secret for TLS.

There is a service called `nginx-static` in the `nginx-static` namespace that is exposing the deployment.

## Task

1. Configure the ConfigMap to **only support TLSv1.3**

2. Add the IP address of the service to `/etc/hosts` and name it `ckaquestion.k8s.local`

3. Verify everything is working:
   ```bash
   # This should FAIL (TLSv1.2 is disabled)
   curl -vk --tls-max 1.2 https://ckaquestion.k8s.local

   # This should WORK
   curl -vk --tlsv1.3 https://ckaquestion.k8s.local
   ```

## Useful commands

```bash
kubectl get configmap -n nginx-static
kubectl edit configmap -n nginx-static
kubectl get svc nginx-static -n nginx-static
```

---
*Click **Check** to validate, or type `hint` for solution notes.*
