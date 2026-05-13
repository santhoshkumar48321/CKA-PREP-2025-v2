#!/bin/bash
REPO=$(find /root -name 'lab.sh' -maxdepth 4 2>/dev/null | head -1 | xargs dirname 2>/dev/null)
if [[ -z "$REPO" ]]; then
  echo "Cloning lab repo..."
  git clone --branch custom-main https://github.com/santhoshkumar48321/CKA-PREP-2025-v2.git /root/CKA-PREP-2025-v2
  REPO="/root/CKA-PREP-2025-v2"
fi
source "$REPO/lab.sh" 2>/dev/null
_lab_save 2
bash "$REPO/Question-2-ArgoCD/LabSetUp.bash"
