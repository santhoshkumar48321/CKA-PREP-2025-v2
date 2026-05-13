# Q12: Ingress

## Task

1. Expose the existing deployment with a service called `echo-service`:
   - Service Port: `8080`
   - Type: `NodePort`

2. Create a new Ingress resource named `echo` in the `echo-sound` namespace for:
   ```
   http://example.org/echo
   ```

3. The availability of the service can be checked using:
   ```bash
   curl NODEIP:NODEPORT/echo
   ```

> 💡 In the exam, you may be given a command like:
> ```bash
> curl -o /dev/null -s -w "%{http_code}\n" http://example.org/echo
> ```
> This requires an Ingress controller. Ensure your `/etc/hosts` has an entry pointing your NodeIP to `example.org`.

## Useful commands

```bash
kubectl get deployment -n echo-sound
kubectl expose deployment -n echo-sound --help
kubectl get ingress -n echo-sound
```

🎬 Video walkthrough: https://youtu.be/sy9zABvDedQ

---
*Click **Check** to validate, or type `hint` for solution notes.*
