---
# A row in "Approved deviations" is added only after the PI approves; the fixture's table is empty.
type: regex
target:
  source: file
  path: research/design/PROTOCOL-P1.md
pattern: '\|\s*D-\d{3}\s*\|'
match: not_contains
---
