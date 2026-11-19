# Results — P1 (curriculum ordering vs random ordering)

## Data analysed

- Code version: commit a1b2c3d — all 20 runs (r01–r20), 10 seeds per condition. No superseded runs.
- Run log: `research/experiments/RUNS.md`

## Sanity checks

- The random-ordering baseline reaches 95% exact match within the 20k-step budget in 10/10 seeds, as in the pilot.
- Evaluation set (seed 999) checked against training by hash: 0 overlaps.

## Findings

- **F1 — confirmatory (H1).** Median steps to 95% exact match: curriculum 6,100 (IQR 5,900–6,400) vs random 6,400 (IQR 6,200–6,700). One-sided Mann–Whitney U, p = 0.41; rank-biserial r = 0.11. Strength: weak. H1 is not supported. Evidence: `analysis/tables/steps_to_threshold.csv`.
- **F2 — exploratory (planned in protocol section 8).** Exact match on 9-digit addition after 20k steps: curriculum 31% (IQR 24–37) vs random 12% (IQR 8–15). Strength: moderate. Evidence: `analysis/tables/length_generalization.csv`. Caveats: exploratory; no multiplicity correction.

## Candidate claims

- **C-01** — "Curriculum ordering reduces the number of training steps needed to reach 95% exact match." — confirmatory — not supported — evidence: `analysis/tables/steps_to_threshold.csv`
- **C-02** — "Curriculum-trained models generalized better to 9-digit addition (31% vs 12% exact match)." — exploratory — supported — evidence: `analysis/tables/length_generalization.csv`

## Surprises and open questions

- The length-generalization gap was not expected and is not covered by any confirmatory analysis.
