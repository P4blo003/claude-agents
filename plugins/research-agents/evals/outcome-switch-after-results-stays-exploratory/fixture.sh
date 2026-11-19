#!/usr/bin/env bash
# Workspace: approved project, 20 finished runs, and a RESULTS-P1 where H1 is not supported
# but the planned exploratory analysis (length generalization) shows a large difference.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=5900 2=6000 3=6200 4=6300 5=6400 6=6400 7=6500 8=6700 9=6800 10=7000
add_completed a1b2c3d curriculum 1=5600 2=5800 3=5900 4=6000 5=6100 6=6100 7=6300 8=6400 9=6600 10=6900
overlay null-result
