<p align="center">
  <img src="assets/banner.svg" alt="Claude Agents" width="100%">
</p>

A Claude Code plugin marketplace bundling specialized subagents for coding and research projects. Install only what each project needs.

---

## Installation

```
/plugin marketplace add P4blo003/claude-agents
/plugin install research-agents@p4blo003-claude-agents
```

## Plugins

| Plugin | Status | Contents |
|---|---|---|
| `research-agents` | Available | A coordinator skill and seven research subagents |
| `dev-agents` | In progress — not yet listed in the marketplace | A software development team |

## research-agents

Start or resume a research project with:

```
/research-agents:research-lead [research question]
```

To review an existing project without changing it:

```
/research-agents:research-lead review
```

The session becomes the research coordinator. It sets up a `research/` workspace (brief, decision log, literature, protocols, runs, analyses, manuscript, reviews), delegates the work to the subagents and stops at every decision gate. You are the Principal Investigator: agents propose, only you approve.

| Agent | Role | Model |
|---|---|---|
| `literature-scout` | Searches, verifies and synthesizes literature; keeps a verified BibTeX file | sonnet |
| `methodologist` | Designs the study protocol: hypotheses, data, comparisons, measures, analysis plan | opus |
| `research-software-engineer` | Writes and tests the code: pipelines, baselines, metrics, benchmarks, plotting | sonnet |
| `experiment-engineer` | Checks the code against the protocol, runs it and logs every run | sonnet |
| `data-analyst` | Analyzes results following the approved plan, including null and negative results | sonnet |
| `scientific-writer` | Drafts the manuscript from approved claims, traceable results and verified references | opus |
| `reviewer-2` | Independent, read-only peer review before every gate | opus |

Decision gates: **G1** brief → **G2** literature → **G3** protocol → **G4** supported claims → **G5** manuscript.
