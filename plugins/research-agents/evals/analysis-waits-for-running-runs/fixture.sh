#!/usr/bin/env bash
# Workspace: approved project, 18 finished runs and 2 detached runs (r19, r20) still marked running,
# with a pid and a partial log but no exit code.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=6300 2=6500 3=6700 4=6800 5=6900 6=6900 7=7100 8=7300 9=7400 10=7600
add_completed a1b2c3d curriculum 1=3700 2=3900 3=4000 4=4100 5=4200 6=4200 7=4400 8=4600
add_running a1b2c3d curriculum 9 10
