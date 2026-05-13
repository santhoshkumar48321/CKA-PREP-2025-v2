# Q16: NodePort Service

There is a deployment named `nodeport-deployment` in the `relative` namespace.

## Task

1. Configure the deployment so it can be exposed on **port 80**:
   - Name: `http`
   - Protocol: `TCP`

2. Create a new Service named `nodeport-service`:
   - Expose container port `80`
   - Protocol: `TCP`
   - NodePort: `30080`

3. Configure the new Service to also expose the **individual pods** using NodePort

## Useful commands

```bash
kubectl get deployment nodeport-deployment -n relative -o yaml
kubectl expose deployment nodeport-deployment -n relative --help
kubectl get svc -n relative
curl $(kubectl get node -o jsonpath='{.items[0].status.addresses[0].address}'):30080
```

---
*Click **Check** to validate, or type `hint` for solution notes.*
