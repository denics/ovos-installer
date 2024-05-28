#!/bin/env bash

# shellcheck source=locales/en-us/misc.sh
source "tui/locales/$LOCALE/misc.sh"

# shellcheck source=welcome.sh
source tui/welcome.sh

# shellcheck source=detection.sh
source tui/detection.sh

# shellcheck source=methods.sh
source tui/methods.sh

# shellcheck source=channels.sh
source tui/channels.sh

# shellcheck source=profiles.sh
source tui/profiles.sh

if [[ "$PROFILE" != "satellite" ]]; then
    # shellcheck source=features.sh
    source tui/features.sh
else
    export FEATURE_GUI="false"
    export FEATURE_SKILLS="false"
    export FEATURE_OCP="false"
    export FEATURE_TTS="false"
    export FEATURE_STT="false"
    export FEATURE_WW="false"
    export FEATURE_PHAL="false"
fi


if [[ "$FEATURE_GUI" ]]; then
    # shellcheck source=gui.sh
    source tui/gui.sh
fi

if [[ "$FEATURE_SKILLS" ]]; then
    # shellcheck source=skills.sh
    source tui/skills.sh
fi

if [[ "$FEATURE_OCP" ]]; then
    # shellcheck source=ocp.sh
    source tui/ocp.sh
fi

if [[ "$FEATURE_TTS" ]]; then
    # shellcheck source=tts.sh
    source tui/tts.sh
fi

if [[ "$FEATURE_STT" ]]; then
    # shellcheck source=stt.sh
    source tui/stt.sh
fi

if [[ "$FEATURE_WW" ]]; then
    # shellcheck source=ww.sh
    source tui/ww.sh
fi

if [[ "$FEATURE_PHAL" ]]; then
    # shellcheck source=phal.sh
    source tui/phal.sh
fi

if [[ "$PROFILE" == "satellite" ]]; then
    # shellcheck source=satellite/main.sh
    source tui/satellite/main.sh
fi

if [[ "$RASPBERRYPI_MODEL" != "N/A" ]]; then
    # shellcheck source=tuning.sh
    source tui/tuning.sh
else
    export TUNING="no"
fi

# shellcheck source=summary.sh
source tui/summary.sh

# shellcheck source=telemetry.sh
source tui/telemetry.sh
