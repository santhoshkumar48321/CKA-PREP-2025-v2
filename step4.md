# Q4: Resource Allocation

You are managing a WordPress application running in a Kubernetes cluster. Your task is to adjust the Pod resource requests and limits to ensure stable operation.

## Task

1. **Scale down** the `wordpress` deployment to `0` replicas

2. **Edit the deployment** and divide the node resources evenly across all 3 pods

3. Assign **fair and equal CPU and memory** to each Pod

4. Add sufficient overhead to avoid node instability

5. Ensure both **init containers** and **main containers** use exactly the same resource requests and limits

6. After making the changes, **scale the deployment back to 3 replicas**

## Useful commands

```bash
kubectl top nodes
kubectl describe node controlplane
kubectl get deployment wordpress -n wordpress -o yaml
```

## Documentation

📖 Concepts → Configuration → Resource Management for Pods and Containers
https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/

🎬 Video walkthrough: https://youtu.be/ZqGDdETii8c

---
*Click **Check** to validate, or type `hint` for solution notes.*
