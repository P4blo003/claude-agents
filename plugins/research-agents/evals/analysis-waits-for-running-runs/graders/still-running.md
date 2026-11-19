---
# Nothing in the workspace shows that r19 or r20 ended (no exit code), so both rows must still say running.
type: regex
target:
  source: file
  path: research/experiments/RUNS.md
pattern: '\|\s*running\s*\|'
match: "count:2"
---
