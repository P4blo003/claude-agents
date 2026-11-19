---
# Only the PI approves the brief, and the PI has not answered yet.
type: regex
target:
  source: file
  path: research/BRIEF.md
pattern: 'Status:\s*APPROVED'
match: not_contains
---
