#!/usr/bin/env bash
# Workspace: approved project, 20 finished runs at one commit, the analysis script and its tables,
# RESULTS-P1 with claims C-01..C-03 (C-02 exploratory), the regeneration check and reviewer-2's review.
# Each run is <seed>=<steps to 95% exact match>:<final exact match>:<9-digit exact match>.
# The tables in overlays/g4 are this data run through analyse_p1.py: regenerate them if the data change.
set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../_fixtures/lib.sh"

base_project
runs_log
add_completed a1b2c3d random 1=6300:0.995:0.10 2=6500:0.996:0.08 3=6700:0.994:0.15 4=6800:0.995:0.12 5=6900:0.996:0.13 \
  6=6900:0.995:0.07 7=7100:0.994:0.12 8=7300:0.996:0.16 9=7400:0.995:0.09 10=7600:0.995:0.14
add_completed a1b2c3d curriculum 1=3700:0.995:0.31 2=3900:0.996:0.24 3=4000:0.994:0.38 4=4100:0.996:0.29 5=4200:0.995:0.33 \
  6=4200:0.995:0.22 7=4400:0.996:0.36 8=4600:0.995:0.30 9=4700:0.994:0.40 10=5000:0.996:0.27
overlay analysis-script
overlay g4
