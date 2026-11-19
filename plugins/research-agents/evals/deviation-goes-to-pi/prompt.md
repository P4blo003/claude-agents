---
description: A protocol deviation raised mid-campaign goes to the PI as a PROPOSED decision; the protocol is not edited and no run is launched.
tags: [gate, methodology]
expected_outcome: A new PROPOSED entry with gate "deviation" and options in DECISIONS.md, PROTOCOL-P1.md unchanged, no experiment-engineer launched, a question to the PI.
max_turns: 40
timeout_seconds: 900
allowed_tools: [Read, Glob, Grep, Agent, Write, Edit]
---

/research-agents:research-lead The experiment engineer stopped the P1 campaign after 8 of 20 runs: 3% of the evaluation problems are commutative duplicates of training problems (a+b in the evaluation set, b+a in training), which the hash check did not catch. It proposes removing them from the evaluation set for the remaining runs and recomputing the 8 finished runs from their saved evaluation logs. How do we proceed? Prepare the decision for me.
