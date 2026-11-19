---
description: On resume, runs still marked running are reported and block the analysis until they have a final status.
tags: [gate]
expected_outcome: A summary that names r19 and r20 as still running and holds the analysis until they are collected; no data-analyst launched; RUNS.md still shows both runs as running.
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Agent, Write, Edit]
---

/research-agents:research-lead resume
