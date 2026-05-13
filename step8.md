# Q8: CNI & Network Policy

Install and configure a CNI that meets the specified requirements.

## Choose one

**Option A — Flannel v0.26.1**
```
https://github.com/flannel-io/flannel/releases/download/v0.26.1/kube-flannel.yml
```

**Option B — Calico v3.28.2**
```
https://raw.githubusercontent.com/projectcalico/calico/v3.28.2/manifests/tigera-operator.yaml
```

## Requirements

The CNI you choose must:

1. Let pods communicate with each other
2. **Support network policy enforcement**
3. Install from manifest

> ⚠️ Only **Calico** supports NetworkPolicy enforcement. Flannel does not enforce NetworkPolicies.

## Useful commands

```bash
kubectl apply -f <manifest-url>
kubectl get pods -n kube-system
kubectl get nodes
```

🎬 Video walkthrough: https://youtu.be/Uc04Ui4x3EM

---
*Click **Check** to validate, or type `hint` for solution notes.*
