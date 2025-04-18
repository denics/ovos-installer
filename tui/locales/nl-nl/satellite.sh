#!/bin/env bash

# Global message
content="Door verbinding te maken met de HiveMind Listener krijgen HiveMind-satellieten toegang tot een netwerk van gedeelde kennis en skills die een uniforme en efficiënte taalondersteuning en -automatisering mogelijk maken."

# Host
CONTENT_HOST="
$content

Voer de host van de HiveMind listener in (DNS of IP-adres):
"

# Port
CONTENT_PORT="
$content

Voer de HiveMind listener poort in:
"

# Key
CONTENT_KEY="
$content

Voer de HiveMind listener sleutel in, behorende bij de satelliet:
"

# Password
CONTENT_PASSWORD="
$content

Voer het HiveMind listener wachtwoord in, behorende bij de satelliet:
"

TITLE_HOST="OpenVoice OS Installatie - Satelliet 1/4"
TITLE_PORT="OpenVoice OS Installatie - Satelliet 2/4"
TITLE_KEY="OpenVoice OS Installatie - Satelliet 3/4"
TITLE_PASSWORD="OpenVoice OS Installatie - Satelliet 4/4"

export CONTENT_HOST CONTENT_PORT CONTENT_KEY CONTENT_PASSWORD TITLE_HOST TITLE_PORT TITLE_KEY TITLE_PASSWORD
