#!/usr/bin/env bash
# =============================================================================
# lab.sh  –  CKA Practice Lab Runner
#
# USAGE:
#   source lab.sh           # load all commands into your current shell
#
# COMMANDS (after sourcing):
#   lab                     → show the question menu
#   lab <N>                 → jump to question N (setup + show question)
#   next                    → move to next question
#   prev                    → move to previous question
#   validate                → validate your current answer
#   hint                    → show solution notes for current question
#   cleanup                 → cleanup resources for current question
#   status                  → show which question you're on
# =============================================================================

# ── detect repo root (works whether sourced from any directory) ────────────────
_LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_LAB_STATE_FILE="$HOME/.cka_lab_state"
_LAB_TOTAL=19

# ── colours ──────────────────────────────────────────────────────────────────
_C_RESET='\033[0m'
_C_BOLD='\033[1m'
_C_CYAN='\033[0;36m'
_C_GREEN='\033[0;32m'
_C_YELLOW='\033[1;33m'
_C_RED='\033[0;31m'
_C_BLUE='\033[0;34m'
_C_MAGENTA='\033[0;35m'

# ── helpers ──────────────────────────────────────────────────────────────────

_lab_divider() {
  echo -e "${_C_CYAN}══════════════════════════════════════════════════════${_C_RESET}"
}

_lab_find_dir() {
  local num="$1"
  find "$_LAB_DIR" -maxdepth 1 -type d -name "Question-${num}-*" | head -1
}

_lab_get_title() {
  local num="$1"
  local dir
  dir="$(_lab_find_dir "$num")"
  [[ -n "$dir" ]] && basename "$dir" | sed "s/Question-${num}-//" | tr '-' ' '
}

_lab_current() {
  [[ -f "$_LAB_STATE_FILE" ]] && cat "$_LAB_STATE_FILE" || echo ""
}

_lab_save() {
  echo "$1" > "$_LAB_STATE_FILE"
}

_lab_show_question() {
  local num="$1"
  local dir
  dir="$(_lab_find_dir "$num")"
  if [[ -z "$dir" ]]; then
    echo -e "${_C_RED}Question $num not found.${_C_RESET}"
    return 1
  fi

  local qfile="$dir/Questions.bash"
  [[ ! -f "$qfile" ]] && { echo -e "${_C_RED}Questions.bash missing for Q$num${_C_RESET}"; return 1; }

  _lab_divider
  echo -e "${_C_BOLD}${_C_CYAN}  Question $num — $(_lab_get_title "$num")${_C_RESET}"
  _lab_divider
  echo ""
  # Strip leading # comment markers for clean display
  grep -v '^#!' "$qfile" | sed 's/^# \{0,1\}//' | sed '/^$/N;/^\n$/d'
  echo ""
  _lab_divider
  echo -e "  ${_C_GREEN}hint${_C_RESET}     → solution notes   ${_C_GREEN}validate${_C_RESET} → check your work"
  echo -e "  ${_C_GREEN}next${_C_RESET}     → next question    ${_C_GREEN}prev${_C_RESET}     → previous question"
  echo -e "  ${_C_GREEN}cleanup${_C_RESET}  → remove resources ${_C_GREEN}status${_C_RESET}   → current question"
  _lab_divider
}

_lab_run_setup() {
  local num="$1"
  local dir
  dir="$(_lab_find_dir "$num")"
  local setup="$dir/LabSetUp.bash"

  echo -e "\n${_C_YELLOW}⚙  Setting up lab for Question $num...${_C_RESET}\n"
  chmod +x "$setup"
  bash "$setup"
  echo ""
}

# ── menu ─────────────────────────────────────────────────────────────────────

_lab_menu() {
  local current
  current="$(_lab_current)"

  echo ""
  _lab_divider
  echo -e "${_C_BOLD}${_C_CYAN}       CKA Practice Labs  •  2025 Edition${_C_RESET}"
  _lab_divider

  local topics=(
    "1:MariaDB — Persistent Volume"
    "2:ArgoCD — Install via Helm"
    "3:Sidecar Container"
    "4:Resource Allocation"
    "5:HPA — HorizontalPodAutoscaler"
    "6:CRDs — cert-manager"
    "7:PriorityClass"
    "8:CNI & Network Policy"
    "9:cri-dockerd"
    "10:Taints & Tolerations"
    "11:Gateway API"
    "12:Ingress"
    "13:Network Policy"
    "14:Storage Class"
    "15:Etcd Fix"
    "16:NodePort Service"
    "17:TLS Config"
    "18:kubectl patch — Resource Limits"
    "19:Resource Allocation v2 — Pod Scheduling"
  )

  for entry in "${topics[@]}"; do
    local n="${entry%%:*}"
    local title="${entry#*:}"
    if [[ "$n" == "$current" ]]; then
      echo -e "  ${_C_GREEN}▶  $n. ${title}${_C_RESET}  ${_C_YELLOW}← current${_C_RESET}"
    else
      echo -e "  ${_C_BLUE}   $n. ${_C_RESET}${title}"
    fi
  done

  _lab_divider
  if [[ -n "$current" ]]; then
    echo -e "  Current: ${_C_GREEN}Q$current — $(_lab_get_title "$current")${_C_RESET}"
    echo -e "  Type ${_C_CYAN}lab <N>${_C_RESET} to jump to a question, or ${_C_CYAN}next${_C_RESET} / ${_C_CYAN}prev${_C_RESET} to navigate."
  else
    echo -e "  Type ${_C_CYAN}lab <N>${_C_RESET} to start a question  (e.g. ${_C_CYAN}lab 1${_C_RESET})"
  fi
  _lab_divider
  echo ""
}

# ── public commands ───────────────────────────────────────────────────────────

lab() {
  if [[ $# -eq 0 ]]; then
    _lab_menu
    return
  fi

  local num="$1"
  if ! [[ "$num" =~ ^[0-9]+$ ]] || (( num < 1 || num > _LAB_TOTAL )); then
    echo -e "${_C_RED}Invalid question number '$num'. Use 1–$_LAB_TOTAL.${_C_RESET}"
    return 1
  fi

  local dir
  dir="$(_lab_find_dir "$num")"
  if [[ -z "$dir" ]]; then
    echo -e "${_C_RED}Question $num directory not found.${_C_RESET}"
    return 1
  fi

  _lab_save "$num"
  _lab_run_setup "$num"
  _lab_show_question "$num"
}

next() {
  local current
  current="$(_lab_current)"
  if [[ -z "$current" ]]; then
    echo -e "${_C_YELLOW}No question active. Use 'lab <N>' to start one.${_C_RESET}"
    return 1
  fi
  local next_num=$(( current + 1 ))
  if (( next_num > _LAB_TOTAL )); then
    echo -e "${_C_YELLOW}You're on the last question (Q$current). No next question.${_C_RESET}"
    return 0
  fi
  echo -e "${_C_CYAN}Moving from Q$current → Q$next_num${_C_RESET}"
  lab "$next_num"
}

prev() {
  local current
  current="$(_lab_current)"
  if [[ -z "$current" ]]; then
    echo -e "${_C_YELLOW}No question active. Use 'lab <N>' to start one.${_C_RESET}"
    return 1
  fi
  local prev_num=$(( current - 1 ))
  if (( prev_num < 1 )); then
    echo -e "${_C_YELLOW}You're on the first question (Q$current). No previous question.${_C_RESET}"
    return 0
  fi
  echo -e "${_C_CYAN}Moving from Q$current → Q$prev_num${_C_RESET}"
  lab "$prev_num"
}

validate() {
  local current
  current="$(_lab_current)"
  if [[ -z "$current" ]]; then
    echo -e "${_C_YELLOW}No question active. Use 'lab <N>' to start one.${_C_RESET}"
    return 1
  fi
  local dir
  dir="$(_lab_find_dir "$current")"
  local script="$dir/validate.bash"
  if [[ ! -f "$script" ]]; then
    echo -e "${_C_YELLOW}No validate.bash found for Q$current.${_C_RESET}"
    return 1
  fi
  echo -e "\n${_C_CYAN}Validating Q$current — $(_lab_get_title "$current")...${_C_RESET}\n"
  chmod +x "$script"
  bash "$script"
}

hint() {
  local current
  current="$(_lab_current)"
  if [[ -z "$current" ]]; then
    echo -e "${_C_YELLOW}No question active. Use 'lab <N>' to start one.${_C_RESET}"
    return 1
  fi
  local dir
  dir="$(_lab_find_dir "$current")"
  local notes="$dir/SolutionNotes.bash"
  if [[ ! -f "$notes" ]]; then
    echo -e "${_C_YELLOW}No SolutionNotes.bash found for Q$current.${_C_RESET}"
    return 1
  fi
  _lab_divider
  echo -e "${_C_BOLD}${_C_MAGENTA}  Hint — Q$current: $(_lab_get_title "$current")${_C_RESET}"
  _lab_divider
  echo ""
  grep -v '^#!' "$notes" | sed 's/^# \{0,1\}//'
  echo ""
  _lab_divider
}

cleanup() {
  local current
  current="$(_lab_current)"
  if [[ -z "$current" ]]; then
    echo -e "${_C_YELLOW}No question active. Nothing to clean up.${_C_RESET}"
    return 0
  fi
  local dir
  dir="$(_lab_find_dir "$current")"
  local script="$dir/cleanup.bash"
  if [[ ! -f "$script" ]]; then
    echo -e "${_C_YELLOW}No cleanup.bash found for Q$current.${_C_RESET}"
    return 0
  fi
  echo -e "\n${_C_YELLOW}Cleaning up Q$current — $(_lab_get_title "$current")...${_C_RESET}\n"
  chmod +x "$script"
  bash "$script"
  echo -e "\n${_C_GREEN}Cleanup done.${_C_RESET}"
}

status() {
  local current
  current="$(_lab_current)"
  if [[ -z "$current" ]]; then
    echo -e "${_C_YELLOW}No question active. Use 'lab <N>' to start one.${_C_RESET}"
  else
    echo -e "${_C_GREEN}Current question: Q$current — $(_lab_get_title "$current")${_C_RESET}"
    echo -e "Commands: ${_C_CYAN}validate${_C_RESET}  ${_C_CYAN}hint${_C_RESET}  ${_C_CYAN}next${_C_RESET}  ${_C_CYAN}prev${_C_RESET}  ${_C_CYAN}cleanup${_C_RESET}"
  fi
}

# ── welcome banner (shown once on source) ────────────────────────────────────
echo ""
echo -e "${_C_BOLD}${_C_CYAN}  CKA Practice Lab loaded ✓${_C_RESET}"
echo -e "  Run ${_C_CYAN}lab${_C_RESET} to see the question menu."
echo -e "  Run ${_C_CYAN}lab <N>${_C_RESET} to jump straight to a question."
echo ""
