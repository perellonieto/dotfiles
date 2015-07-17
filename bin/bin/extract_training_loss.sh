#!/usr/bin/env bash

set -o pipefail
set -o errexit
# set -o xtrace

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

INFO="${1:-Undefined}"
LOSS="${2:-Undefined}"

[ $# -lt 2 ] && { echo "Usage: $0 info_file loss_file" ; exit 1; }

# set -o nounset

echo "training error" > "${LOSS}"
grep loss "${INFO}" | tr -s ' ' | cut -d\  -f9 | sed '/^$/d' >> "${LOSS}"
