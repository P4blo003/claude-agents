#!/usr/bin/env bash
# Workspace: approved project with the run campaign under way — 8 of 20 runs finished.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=6300 2=6500 3=6700 4=6800
add_completed a1b2c3d curriculum 1=3700 2=3900 3=4000 4=4100
