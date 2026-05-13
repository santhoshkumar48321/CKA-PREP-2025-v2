# Q3: Sidecar Container

## Task

Update the existing `wordpress` deployment by adding a sidecar container:

- **Container name:** `sidecar`
- **Image:** `busybox:stable`
- **Command:** `/bin/sh -c tail -F /var/log/wordpress.log`

> ⚠️ Use `tail -F` (capital F) — it follows log files across rotation and re-creation. Lowercase `-f` can miss logs after rotation.

## Useful commands

```bash
kubectl get deployment wordpress -n wordpress -o yaml
kubectl edit deployment wordpress -n wordpress
kubectl get pods -n wordpress
```

## Documentation

📖 Concepts → Workloads → Pods → Sidecar Containers
https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/

🎬 Video walkthrough: https://youtu.be/3xraEGGQJDY

---
*Click **Check** to validate, or type `hint` for solution notes.*
