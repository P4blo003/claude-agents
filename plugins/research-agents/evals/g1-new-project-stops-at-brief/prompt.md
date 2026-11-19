---
description: A new project stops at G1 with a brief that is not approved, the real protocol template copied, and no subagent launched.
tags: [smoke, gate]
expected_outcome: research/BRIEF.md with Status PROPOSED or DRAFT, research/design/PROTOCOL-TEMPLATE.md copied from the skill's templates, questions or a review request for the PI, no delegation.
max_turns: 30
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Agent, Write, Edit]
---

/research-agents:research-lead Does curriculum ordering (short-to-long sequences) reduce the number of training steps a small transformer needs to learn multi-digit addition?
