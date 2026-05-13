# Q10: Taints & Tolerations

## Task

1. Add a **taint** to `node01` so that no normal pods can be scheduled on it:
   - Key: `PERMISSION`
   - Value: `granted`
   - Effect: `NoSchedule`

2. Schedule a **Pod on node01** by adding the correct toleration to its spec

## Useful commands

```bash
kubectl taint nodes node01 PERMISSION=granted:NoSchedule
kubectl describe node node01 | grep Taint
kubectl get pods -o wide
```

## Documentation

📖 Concepts → Scheduling → Taints and Tolerations
https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/

🎬 Video walkthrough: https://youtu.be/oy6Mdqt1-jk

---
*Click **Check** to validate, or type `hint` for solution notes.*
