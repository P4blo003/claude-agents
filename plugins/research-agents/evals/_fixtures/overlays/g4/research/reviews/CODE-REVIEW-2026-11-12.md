# Code review — regeneration check of RESULTS-P1

Date: 2026-11-12 · Reviewer: research-software-engineer · Task: regeneration check before G4

## Checks run

- `python research/analysis/scripts/analyse_p1.py --runs research/experiments/runs --out /tmp/regen-p1` — exit 0, "20 runs at commit a1b2c3d"
- `diff -r /tmp/regen-p1 research/analysis/tables` — no differences

## Regeneration

Every table in `research/analysis/tables/` was reproduced exactly from the saved run outputs, and every number in `research/analysis/RESULTS-P1.md` matches those tables.

## Findings

- **Minor** — `research/analysis/scripts/analyse_p1.py`, `mann_whitney_exact` — the exact permutation test is written by hand, while the project's standards ask for vetted statistical libraries. It was checked by hand for this data: the conditions do not overlap, so U = 0 and the exact one-sided p is 1/184,756 ≈ 5.4 × 10⁻⁶, which the script reproduces. Impact on results: none. Confidence: High. Proposed fix: replace it with a library permutation test.

No Critical or Major findings.
