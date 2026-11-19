#!/usr/bin/env bash
# Workspace: approved project, 20 finished runs at one commit, RESULTS-P1 with claims C-01..C-03
# (C-02 exploratory), the regeneration check and reviewer-2's review of the results.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=6300 2=6500 3=6700 4=6800 5=6900 6=6900 7=7100 8=7300 9=7400 10=7600
add_completed a1b2c3d curriculum 1=3700 2=3900 3=4000 4=4100 5=4200 6=4200 7=4400 8=4600 9=4700 10=5000
overlay g4
