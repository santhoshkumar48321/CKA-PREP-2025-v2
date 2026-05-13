#!/bin/bash
REPO=$(find /root -name 'lab.sh' -maxdepth 4 2>/dev/null | head -1 | xargs dirname 2>/dev/null || echo '/root/CKA-PREP-2025-v2')
bash "$REPO/Question-9-Cri-Dockerd/validate.bash"
