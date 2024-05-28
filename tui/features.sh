#!/bin/env bash

# shellcheck source=locales/en-us/features.sh
source "tui/locales/$LOCALE/features.sh"

export FEATURE_OCP="false"
export FEATURE_TTS="false"
export FEATURE_STT="false"
export FEATURE_WW="false"
export FEATURE_PHAL="false"
export FEATURE_GUI="false"
export FEATURE_SKILLS="false"

features=("ocp" "$OCP_DESCRIPTION" ON)
features+=("tts" "$TTS_DESCRIPTION" ON)
features+=("stt" "$STT_DESCRIPTION" ON)
features+=("ww" "$WW_DESCRIPTION" ON)
features+=("phal" "$PHAL_DESCRIPTION" ON)
features+=("skills" "$SKILL_DESCRIPTION" ON)
if [[ "$RASPBERRYPI_MODEL" != *"Raspberry Pi 3"* ]] && [[ "$KERNEL" != *"microsoft"* ]] && [ "$PROFILE" != "server" ]; then
  features+=("gui" "$GUI_DESCRIPTION" OFF)
fi


OVOS_FEATURES=$(whiptail --separate-output --title "$TITLE" \
  --checklist "$CONTENT" --cancel-button "$BACK_BUTTON" --ok-button "$OK_BUTTON" --yes-button "$OK_BUTTON" "$TUI_WINDOW_HEIGHT" "$TUI_WINDOW_WIDTH" "${#features[@]}" "${features[@]}" 3>&1 1>&2 2>&3)

exit_status=$?

if [ "$exit_status" -ne 0 ]; then
  source tui/profiles.sh
  if [[ "$PROFILE" == "satellite" ]]; then
      source tui/satellite/main.sh
  else
      source tui/features.sh
  fi
fi

for FEATURE in $OVOS_FEATURES; do
  case "$FEATURE" in
  "gui")
    export FEATURE_GUI="true"
    ;;
  "skills")
    export FEATURE_SKILLS="true"
    ;;
  "ocp")
    export FEATURE_OCP="true"
    ;;
  "tts")
    export FEATURE_TTS="true"
    ;;
  "stt")
    export FEATURE_STT="true"
    ;;
  "phal")
    export FEATURE_PHAL="true"
    ;;
  "ww")
    export FEATURE_WW="true"
    ;;
  esac
done
