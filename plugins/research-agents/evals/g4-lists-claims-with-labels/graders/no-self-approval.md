---
# The fixture has exactly three approved entries (D-001..D-003). A fourth means the coordinator approved on the PI's behalf.
type: regex
target:
  source: file
  path: research/DECISIONS.md
pattern: 'Status:\s*APPROVED'
match: "count:3"
---
