#!/bin/env bash
# installer_osx.sh – macOS‑only version

set -eE
trap 'echo "Fatal error on macOS – see $LOG_FILE"; exit 1' ERR

# 1. Install prerequisites via Homebrew
brew_update() { brew update &>/dev/null; }
ensure_brew() {
  command -v brew >/dev/null || {
    echo "Homebrew not found – installing now"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  }
}

ensure_brew
brew_update
brew install coreutils dialog jq yq ansible

# 2. Prepare a virtualenv
VENV_PATH="$HOME/.ovos/venv"
python3 -m venv "$VENV_PATH"
source "$VENV_PATH/bin/activate"
pip install --upgrade ansible

# 3. Copy the common helpers you **do NOT** have to rewrite
source utils/constants.sh
source utils/banner.sh
source utils/common.sh   # the functions that are cross‑platform

# 4. Run the playbook exactly as before
${0%_osx.sh}/execute_ansible.sh  # you can put the big ansible block in its own script

# 5. Cleanup / reboot
echo "✅ Open Voice OS installed on macOS"
