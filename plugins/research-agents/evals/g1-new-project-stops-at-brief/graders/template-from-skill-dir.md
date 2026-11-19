---
# The protocol template must be the skill's own file (found through ${CLAUDE_SKILL_DIR}), not rewritten from memory:
# only the real template has the "Approved deviations" section.
type: regex
target:
  source: file
  path: research/design/PROTOCOL-TEMPLATE.md
pattern: '## Approved deviations'
---
