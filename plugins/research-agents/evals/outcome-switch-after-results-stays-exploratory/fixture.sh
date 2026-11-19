#!/usr/bin/env bash
# Workspace: approved project, 20 finished runs, the analysis script and its tables, and a RESULTS-P1
# where H1 is not supported but the planned exploratory analysis (length generalization) shows a large difference.
# Each run is <seed>=<steps to 95% exact match>:<final exact match>:<9-digit exact match>.
# The tables in overlays/null-result are this data run through analyse_p1.py: regenerate them if the data change.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=5900:0.995:0.10 2=6000:0.996:0.08 3=6200:0.994:0.15 4=6300:0.995:0.12 5=6400:0.996:0.13 \
  6=6400:0.995:0.07 7=6500:0.994:0.12 8=6700:0.996:0.16 9=6800:0.995:0.09 10=7000:0.995:0.14
add_completed a1b2c3d curriculum 1=5600:0.995:0.31 2=5800:0.996:0.24 3=5900:0.994:0.38 4=6000:0.996:0.29 5=6100:0.995:0.33 \
  6=6100:0.995:0.22 7=6300:0.996:0.36 8=6400:0.995:0.30 9=6600:0.994:0.40 10=6900:0.996:0.27
overlay analysis-script
overlay null-result
