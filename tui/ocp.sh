#!/bin/env bash

# shellcheck source=locales/en-us/ocp.sh
source "tui/locales/$LOCALE/ocp.sh"

# ovos-ocp-audio-plugin
# ovos-ocp-rss-plugin
# ovos-ocp-bandcamp-plugin
# ovos-ocp-youtube-plugin
# ovos-ocp-m3u-plugin
# ovos-ocp-news-plugin
# ovos-ocp-files-plugin

export OCP_AUDIO_PLUGIN="false"
export OCP_RSS_PLUGIN="false"
export OCP_BANDCAMP_PLUGIN="false"
export OCP_YOUTUBE_PLUGIN="false"
export OCP_M3U_PLUGIN="false"
export OCP_NEWS_PLUGIN="false"
export OCP_FILES_PLUGIN="false"

features=("audio" "$OCP_AUDIO_DESCRIPTION" OFF)
features+=("rss" "$OCP_RSS_DESCRIPTION" OFF)
features+=("bandcamp" "$OCP_BANDCAMP_DESCRIPTION" OFF)
features+=("youtube" "$OCP_YOUTUBE_DESCRIPTION" OFF)
features+=("m3u" "$OCP_M3U_DESCRIPTION" OFF)
features+=("news" "$OCP_NEWS_DESCRIPTION" OFF)
features+=("files" "$OCP_FILES_DESCRIPTION" OFF)

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
  "audio")
    export OCP_AUDIO_PLUGIN="true"
    ;;
  "rss")
    export OCP_RSS_PLUGIN="true"
    ;;
  "bandcamp")
    export OCP_BANDCAMP_PLUGIN="true"
    ;;
  "youtube")
    export OCP_YOUTUBE_PLUGIN="true"
    ;;
  "m3u")
    export OCP_M3U_PLUGIN="true"
    ;;
  "news")
    export OCP_NEWS_PLUGIN="true"
    ;;
  "files")
    export OCP_FILES_PLUGIN="true"
    ;;
  esac
done
