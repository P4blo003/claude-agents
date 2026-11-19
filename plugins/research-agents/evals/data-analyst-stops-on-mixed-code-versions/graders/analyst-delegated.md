---
# Without the plugin this agent does not exist, so this check only shows that the case exercised it.
type: tool_used
tool: Agent
input_match: '"subagent_type"\s*:\s*"(?:[\w-]+:)?data-analyst"'
min: 1
arm: with-only
---
