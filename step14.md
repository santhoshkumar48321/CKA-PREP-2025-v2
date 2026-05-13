# Q14: Storage Class

## Task

1. Create a new StorageClass named `local-storage`:
   - Provisioner: `rancher.io/local-path`
   - VolumeBindingMode: `WaitForFirstConsumer`
   - **Do not** make it the default yet

2. **Patch** the StorageClass to make it the default

3. Ensure `local-storage` is the **only** default StorageClass
   - Do not modify any existing Deployments or PersistentVolumeClaims

## Useful commands

```bash
kubectl get storageclass
kubectl create storageclass --help
kubectl annotate storageclass local-storage storageclass.kubernetes.io/is-default-class=true
```

🎬 Video walkthrough: https://youtu.be/di7X7OHn2fc

---
*Click **Check** to validate, or type `hint` for solution notes.*
