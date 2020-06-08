#!/bin/bash

set -o errexit # exit when a command fails
set -o nounset # exit when using undeclared variables.
set -o pipefail # exit status of the last command that threw a non-zero exit code returns

REVERSE=`ipv6calc -q --out revnibbles.arpa $1`

jq -n --arg reverse "$REVERSE" '{"reversed":$reverse}'