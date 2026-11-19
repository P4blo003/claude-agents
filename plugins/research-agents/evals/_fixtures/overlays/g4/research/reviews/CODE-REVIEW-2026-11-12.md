# Code review — regeneration check of RESULTS-P1

Date: 2026-11-12 · Reviewer: research-software-engineer · Task: regeneration check before G4

## Checks run

- `uv run python research/analysis/scripts/analyse_p1.py --runs research/experiments/runs --out /tmp/regen-p1` — exit 0
- `uv run pytest -p no:cacheprovider` — 41 passed

## Regeneration

Every number, table and figure in `research/analysis/RESULTS-P1.md` was reproduced exactly from the saved run outputs.

## Findings

- **Minor** — `analyse_p1.py:88` — the IQR helper duplicates `numpy.percentile`; replace it with the library call. Impact on results: none (values identical). Confidence: High.

No Critical or Major findings.
