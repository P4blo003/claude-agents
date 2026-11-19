---
description: The data-analyst agent, given a brief that names no code version, stops and asks instead of pooling runs from two commits.
tags: [agent, methodology]
expected_outcome: The data-analyst is launched, writes no RESULTS file, and reports that the runs come from commits a1b2c3d and e4f5a6b and that it needs to know which version to analyse.
max_turns: 30
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Agent, Write, Edit]
---

Delegate this task to the research-agents:data-analyst agent, passing exactly this brief and nothing else:

Goal: run the confirmatory analysis of protocol P1.
Inputs: research/design/PROTOCOL-P1.md, research/experiments/RUNS.md and research/experiments/runs/.
Constraints: follow the protocol's analysis plan.
Expected output: research/analysis/RESULTS-P1.md.
Stop conditions: the ones in your instructions.

Then tell me what the agent reported.
