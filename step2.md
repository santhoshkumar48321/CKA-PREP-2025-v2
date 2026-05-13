# Q2: ArgoCD — Install via Helm (no CRDs)

Your production cluster already has Argo CD CRDs installed. You need to install Argo CD using Helm **without** reinstalling the CRDs.

## Task

1. Add the official Argo CD Helm repository with the name `argocd`
   - URL: `https://argoproj.github.io/argo-helm`

2. Create a namespace called `argocd`

3. Generate a Helm template from the Argo CD chart **version 7.7.3** for the `argocd` namespace

4. Ensure that **CRDs are not installed** by configuring the chart accordingly
   > ⚠️ The `--skip-crds` Helm flag does NOT reliably prevent CRD installation for all charts. Search for the `crds` value in the argo-cd chart and set it to `false`.

5. Save the generated YAML manifest to `/root/argo-helm.yaml`

## Useful commands

```bash
helm repo add argocd https://argoproj.github.io/argo-helm
helm repo update
helm search repo argocd
helm show values argocd/argo-cd --version 7.7.3 | grep -A5 crds
```

🎬 Video walkthrough: https://youtu.be/e0YGRSjb8CU

---
*Click **Check** to validate, or type `hint` for solution notes.*
