---
# The fixture's decision log mentions no claim ids, so all three must come from the new G4 entry.
type: regex
target:
  source: file
  path: research/DECISIONS.md
pattern: '(?=[\s\S]*C-01)(?=[\s\S]*C-02)(?=[\s\S]*C-03)'
---
