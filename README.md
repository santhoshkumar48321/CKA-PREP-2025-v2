# CKA Practice Labs — 2025

Hands-on CKA practice questions derived from the CKA-PREP playlist.  
Clone once, source once, then navigate all 19 questions with simple commands — no scripts to run manually.

> **Note:** This is a living repo and may still have rough edges. Open an issue if you find a bug in a setup or validation script.

---

## Quick Start

```bash
# 1. Clone into your Killercoda / cluster terminal
git clone https://github.com/markdjones82/CKA-PREP-2025-v2.git ~/CKA-PREP-2025-v2
cd ~/CKA-PREP-2025-v2

# 2. Load the lab environment (do this once per terminal session)
source lab.sh

# 3. Show the question menu and pick one
lab
```

That's it. You're in the lab.

---

## Commands

After running `source lab.sh`, you have these commands available anywhere in your shell:

| Command       | What it does                                          |
|---------------|-------------------------------------------------------|
| `lab`         | Show the full question menu                           |
| `lab <N>`     | Jump to question N — runs lab setup, shows the task   |
| `next`        | Move to the next question (runs setup automatically)  |
| `prev`        | Move to the previous question                         |
| `validate`    | Check your solution for the current question          |
| `hint`        | Show step-by-step solution notes                      |
| `cleanup`     | Remove all resources created for the current question |
| `status`      | Show which question you're currently on               |

### Example session

```bash
source lab.sh     # load once

lab 1             # start Question 1 (MariaDB PV) — lab setup runs automatically

# ... do the task ...

validate          # check if you got it right
hint              # stuck? see the solution notes

next              # move on to Question 2 — setup runs automatically

cleanup           # remove Q2 resources when done
```

Your current question is remembered across terminal sessions in `~/.cka_lab_state`.  
Re-source `lab.sh` in a new terminal and pick up right where you left off.

---

## How Each Question is Structured

Every question folder contains:

| File                | Purpose                                               |
|---------------------|-------------------------------------------------------|
| `LabSetUp.bash`     | Creates the cluster state you need to work against    |
| `Questions.bash`    | The task description (what you must do)               |
| `SolutionNotes.bash`| Step-by-step walkthrough / hints                      |
| `validate.bash`     | Automated checks — PASS / FAIL for each requirement   |
| `cleanup.bash`      | Tears down everything created by the lab              |

---

## Available Questions

| # | Topic | Video |
|---|-------|-------|
| 1 | MariaDB — Persistent Volume | https://youtu.be/aXvvc1EB1zg |
| 2 | ArgoCD — Install via Helm (no CRDs) | https://youtu.be/e0YGRSjb8CU |
| 3 | Sidecar Container | https://youtu.be/3xraEGGQJDY |
| 4 | Resource Allocation | https://youtu.be/ZqGDdETii8c |
| 5 | HPA — HorizontalPodAutoscaler | https://youtu.be/YGkARVFKtmM |
| 6 | CRDs — cert-manager | https://youtu.be/SA1DzLQaDJs |
| 7 | PriorityClass | https://youtu.be/CZzxGyF6OHc |
| 8 | CNI & Network Policy | https://youtu.be/Uc04Ui4x3EM |
| 9 | cri-dockerd | https://youtu.be/ybzo1vXiqjU |
| 10 | Taints & Tolerations | https://youtu.be/oy6Mdqt1-jk |
| 11 | Gateway API | https://youtu.be/G9zispvOCHE |
| 12 | Ingress | https://youtu.be/sy9zABvDedQ |
| 13 | Network Policy | https://youtu.be/rA8mXYTU0W8 |
| 14 | Storage Class | https://youtu.be/di7X7OHn2fc |
| 15 | Etcd Fix | https://youtu.be/IL448T6r8H4 |
| 16 | NodePort Service | — |
| 17 | TLS Config | — |
| 18 | kubectl patch — Resource Limits | — |
| 19 | Resource Allocation v2 — Pod Scheduling | — |

---

## Simulated Exam Desktop (VSCodium)

A paid Killercoda subscription is required for the simulated desktop.

```bash
scripts/install-codium.sh
codium --no-sandbox --user-data-dir .
```

---

## Legacy Scripts (still work)

```bash
scripts/run-question.sh 5          # setup + show question
scripts/validate-question.sh 5     # validate
scripts/cleanup-question.sh 5      # cleanup
scripts/validate-question.sh all   # validate all
```
