# Q15: Etcd Fix

After a cluster migration, the `controlplane` kube-apiserver is **not coming up**.

## Background

- Before the migration: etcd was external and in HA mode
- After migration: the kube-apiserver is pointing to the **etcd peer port `2380`** instead of the correct client port

## Task

Fix it.

> 💡 **Hint:** The etcd client port is `2379`. The peer port `2380` is for etcd-to-etcd communication, not for API server connections. Check the kube-apiserver static pod manifest.

## Useful commands

```bash
cat /etc/kubernetes/manifests/kube-apiserver.yaml | grep etcd
kubectl get pods -n kube-system
crictl ps | grep apiserver
journalctl -u kubelet -f
```

🎬 Video walkthrough: https://youtu.be/IL448T6r8H4

---
*Click **Check** to validate, or type `hint` for solution notes.*
