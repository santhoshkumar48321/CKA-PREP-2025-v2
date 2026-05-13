# Q18: kubectl patch — Resource Limits

A deployment named `resource-app` exists in the `patch-ns` namespace. The current resource limits are too low:
- CPU limit: `200m`
- Memory limit: `256Mi`

## Task

Using **only** `kubectl patch` (not `kubectl edit` or `kubectl apply`):

1. Update the **CPU limit** of the `nginx` container to `500m`
2. Update the **Memory limit** of the `nginx` container to `512Mi`

## Constraints

- You **must** use `kubectl patch`
- Do **not** change the CPU or Memory **requests**
- The deployment must remain available (2 replicas)

## Verify your changes

```bash
kubectl get deployment resource-app -n patch-ns \
  -o jsonpath='{.spec.template.spec.containers[0].resources}' | python3 -m json.tool
```

Expected output:
```json
{
  "limits": { "cpu": "500m", "memory": "512Mi" },
  "requests": { "cpu": "100m", "memory": "128Mi" }
}
```

---
*Click **Check** to validate, or type `hint` for solution notes.*
