# Q5: HPA — HorizontalPodAutoscaler

## Task

Create a new HorizontalPodAutoscaler (HPA) named `apache-server` in the `autoscale` namespace:

1. Target the existing deployment `apache-deployment` in the `autoscale` namespace

2. Set the HPA to target **50% CPU usage** per Pod

3. Configure the HPA with:
   - Minimum pods: `1`
   - Maximum pods: `4`

4. Set the **downscale stabilization window** to `30 seconds`

## Useful commands

```bash
kubectl get deployment -n autoscale
kubectl autoscale deployment apache-deployment -n autoscale --help
kubectl get hpa -n autoscale
```

## Documentation

📖 Tasks → Run Application → HPA Walkthrough
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

📖 Concepts → Workloads → Horizontal Pod Autoscaling (for downscale)
https://kubernetes.io/docs/concepts/workloads/autoscaling/horizontal-pod-autoscale/

🎬 Video walkthrough: https://youtu.be/YGkARVFKtmM

---
*Click **Check** to validate, or type `hint` for solution notes.*
