# Q7: PriorityClass

You are working in a Kubernetes cluster with an existing deployment named `busybox-logger` running in the `priority` namespace. The cluster already has at least one user-defined PriorityClass.

## Task

1. Create a new PriorityClass named `high-priority` for user workloads.
   - The value must be exactly **one less** than the highest existing user-defined priority class

2. **Patch** the existing deployment `busybox-logger` in the `priority` namespace to use the newly created `high-priority` class

## Useful commands

```bash
kubectl get priorityclass
kubectl describe priorityclass
kubectl create priorityclass --help
kubectl patch deployment busybox-logger -n priority --help
```

## Documentation

📖 Reference → kubectl create priorityClass
https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_priorityclass/

📖 Tasks → Update API Objects using kubectl patch
https://kubernetes.io/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/

🎬 Video walkthrough: https://youtu.be/CZzxGyF6OHc

---
*Click **Check** to validate, or type `hint` for solution notes.*
