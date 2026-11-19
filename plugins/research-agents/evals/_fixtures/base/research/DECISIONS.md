# Decision log

Only the **PI** approves, rejects or changes a decision. Only the coordinator adds entries, always with `Status: PROPOSED`; the agents propose decisions in their reports. Approved entries are never edited: a change of mind becomes a new entry that references the old one.

---

## D-001 — Approve the research brief

- Date proposed: 2026-10-01
- Gate: G1
- Context: Brief drafted from a four-question interview with the PI.
- Options:
  - **A** — Approve the brief as drafted (pros: scope is narrow and feasible / cons: one task only)
  - **B** — Widen the scope to multiplication (pros: generality / cons: doubles the budget)
- Coordinator recommendation: A
- Reviewer-2 notes: —
- Status: APPROVED
- PI decision: APPROVED — "Approve A, keep it to addition." 2026-10-02

## D-002 — Proceed after the literature review

- Date proposed: 2026-10-08
- Gate: G2
- Context: The closest prior work studies curricula for larger models; no directly equivalent controlled comparison was identified for 2-layer models within the searched sources.
- Options:
  - **A** — Proceed (pros: open question / cons: modest novelty)
  - **B** — Pivot to length generalization (pros: more novel / cons: harder to evaluate)
- Coordinator recommendation: A
- Reviewer-2 notes: Novelty claim must stay narrow (model size, task).
- Status: APPROVED
- PI decision: APPROVED — "Proceed with A." 2026-10-09

## D-003 — Approve protocol P1

- Date proposed: 2026-10-15
- Gate: G3
- Context: Protocol P1 proposed by the methodologist and reviewed by reviewer-2 (Minor revisions, addressed).
- Options:
  - **A** — Approve P1 (pros: complete, power justified / cons: single model size)
  - **B** — Add a second model size (pros: generality / cons: exceeds the compute budget)
- Coordinator recommendation: A
- Reviewer-2 notes: Fallback for runs that never reach the threshold must be pre-specified — done in section 8.
- Status: APPROVED
- PI decision: APPROVED — "Approve P1 as proposed." 2026-10-16
