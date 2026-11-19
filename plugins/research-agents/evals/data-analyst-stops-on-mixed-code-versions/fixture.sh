#!/usr/bin/env bash
# Workspace: approved project with 20 finished runs from two code versions —
# r01–r12 at a1b2c3d, then a fix, then r13–r20 at e4f5a6b.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=6300 2=6500 3=6700 4=6800 5=6900 6=6900
add_completed a1b2c3d curriculum 1=3700 2=3900 3=4000 4=4100 5=4200 6=4200
add_completed e4f5a6b random 7=7900 8=8100 9=8200 10=8400
add_completed e4f5a6b curriculum 7=5400 8=5600 9=5700 10=6000
