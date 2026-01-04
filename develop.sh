#!/usr/bin/env bash 

# Detect the platform
OS="$(uname -s)"

# Directory that contains this very file
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set global variables based on sudo usage
if [ -n "$SUDO_USER" ]; then
    export RUN_AS="$SUDO_USER"
else
    export RUN_AS="$USER"
fi
RUN_AS_HOME=$(eval echo ~"$RUN_AS")
export RUN_AS_HOME

# Check for git command to be installed
if ! command -v git >/dev/null 2>&1; then
    printf "\n\e[31m[fail]\e[0m git command not found..."
    printf "\n       Please install git package before running the installer.\n\n"
    exit 1
fi

# Execute the installer entrypoint

if [[ "$OS" == "Darwin" ]]; then
  bash "${SCRIPT_DIR}/setup_osx.sh" "$@"
else
  bash "${SCRIPT_DIR}/setup.sh" "$@"
fi