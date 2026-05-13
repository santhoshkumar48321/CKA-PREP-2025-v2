# Q1: MariaDB — Persistent Volume

A user accidentally deleted the MariaDB Deployment in the `mariadb` namespace. The deployment was configured with persistent storage. Your responsibility is to re-establish the deployment while ensuring data is preserved by reusing the available PersistentVolume.

## Task

A PersistentVolume already exists and is retained for reuse. Only one PV exists.

1. Create a **PersistentVolumeClaim** named `mariadb` in the `mariadb` namespace with:
   - Access Mode: `ReadWriteOnce`
   - Storage: `250Mi`

2. Edit the MariaDB Deployment file at `~/mariadb-deploy.yaml` to use the PVC created above

3. Apply the updated Deployment file to the cluster

4. Ensure the MariaDB Deployment is **running and stable**

## Useful commands

```bash
kubectl get pv
kubectl get pvc -n mariadb
kubectl get pods -n mariadb
```

## Documentation

📖 Concepts → Storage → Persistent Volumes
https://kubernetes.io/docs/concepts/storage/persistent-volumes/

🎬 Video walkthrough: https://youtu.be/aXvvc1EB1zg

---
*Click **Check** to validate your solution, or type `hint` in the terminal for solution notes.*
