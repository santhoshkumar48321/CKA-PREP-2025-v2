# Q13: Network Policy

There are two deployments: **Frontend** and **Backend**.
- Frontend is in the `frontend` namespace
- Backend is in the `backend` namespace

## Task

1. Look at the Network Policy YAML files in `/root/network-policies`

2. Decide which policy provides the functionality to allow interaction between the frontend and backend deployments in the **least permissive way**

3. Deploy that YAML to the cluster

## Useful commands

```bash
ls /root/network-policies/
cat /root/network-policies/<policy>.yaml
kubectl apply -f /root/network-policies/<policy>.yaml
kubectl get networkpolicy -A
```

🎬 Video walkthrough: https://youtu.be/rA8mXYTU0W8

---
*Click **Check** to validate, or type `hint` for solution notes.*
