# Q19: Resource Allocation v2 — Pod Scheduling

## Scenario

A WordPress deployment in namespace `relative-fawn` has **3 replicas**.

## Task

Edit the WordPress deployment so that each pod's **resource requests** equally divide the node's available resources among the 3 replicas.

> ℹ️ Limits do not need to be changed.

## Useful commands

```bash
kubectl top nodes
kubectl describe node controlplane | grep -A10 "Allocatable"
kubectl get deployment -n relative-fawn
kubectl edit deployment wordpress -n relative-fawn
```

## Documentation

📖 Concepts → Configuration → Resource Management for Pods and Containers
https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/

---
*Click **Check** to validate, or type `hint` for solution notes.*
