# Q9: cri-dockerd

## Task

Set up `cri-dockerd`:

1. Install the debian package `~/cri-dockerd.deb` using `dpkg`

2. **Enable and start** the `cri-docker` service

3. Configure these kernel parameters:
   | Parameter | Value |
   |-----------|-------|
   | `net.bridge.bridge-nf-call-iptables` | `1` |
   | `net.ipv6.conf.all.forwarding` | `1` |
   | `net.ipv4.ip_forward` | `1` |
   | `net.netfilter.nf_conntrack_max` | `131072` |

## Useful commands

```bash
dpkg -i ~/cri-dockerd.deb
systemctl enable --now cri-docker
sysctl -w net.ipv4.ip_forward=1
sysctl --system
```

🎬 Video walkthrough: https://youtu.be/ybzo1vXiqjU

---
*Click **Check** to validate, or type `hint` for solution notes.*
