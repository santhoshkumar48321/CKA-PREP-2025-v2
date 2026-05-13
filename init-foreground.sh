#!/bin/bash
# Clone the lab repo and load helpers into the shell profile
git clone --branch custom-main https://github.com/santhoshkumar48321/CKA-PREP-2025-v2.git ~/CKA-PREP-2025-v2 2>/dev/null || true

# Add source to bashrc so helpers are available in every terminal
grep -q 'source ~/CKA-PREP-2025-v2/lab.sh' ~/.bashrc || \
  echo 'source ~/CKA-PREP-2025-v2/lab.sh 2>/dev/null' >> ~/.bashrc

echo ""
echo "Lab environment ready."
echo "Helper commands available: hint  validate  cleanup  lab <N>"
