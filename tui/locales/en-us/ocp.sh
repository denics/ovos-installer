#!/bin/env bash

source "$(pwd)/utils/common.sh"

CONTENT="
You decided to install OCP
Please choose the plugins to enable:
"
TITLE="Open Voice OS Installation - OCP plugins"

OCP_AUDIO_DESCRIPTION='ovos-ocp-audio-plugin'$(extract_version "https://github.com/OpenVoiceOS/ovos-ocp-audio-plugin/blob/dev/ovos_plugin_common_play/version.py")
OCP_RSS_DESCRIPTION=""
OCP_BANDCAMP_DESCRIPTION=""
OCP_M3U_DESCRIPTION=""
OCP_NEWS_DESCRIPTION=""
OCP_FILES_DESCRIPTION=""

export CONTENT TITLE OCP_AUDIO_DESCRIPTION OCP_RSS_DESCRIPTION OCP_BANDCAMP_DESCRIPTION OCP_M3U_DESCRIPTION OCP_NEWS_DESCRIPTION OCP_NEWS_DESCRIPTION OCP_FILES_DESCRIPTION