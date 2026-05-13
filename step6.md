# Q6: CRDs — cert-manager

## Task

1. Create a list of all **cert-manager CRDs** and save it to `/root/resources.yaml`

2. Using `kubectl`, extract the documentation for the **subject specification field** of the `Certificate` Custom Resource and save it to `/root/subject.yaml`
   - You may use any output format that `kubectl` supports

## Useful commands

```bash
kubectl get crd | grep cert-manager
kubectl get crd certificates.cert-manager.io -o yaml
kubectl explain certificate.spec.subject
```

🎬 Video walkthrough: https://youtu.be/SA1DzLQaDJs

---
*Click **Check** to validate, or type `hint` for solution notes.*
