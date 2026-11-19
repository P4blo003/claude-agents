# Results — P1 (curriculum ordering vs random ordering)

## Data analysed

- Code version: commit a1b2c3d — all 20 runs (r01–r20), 10 seeds per condition. No superseded runs.
- Run log: `research/experiments/RUNS.md`

## Sanity checks

- The random-ordering baseline reaches 95% exact match within the 20k-step budget in 10/10 seeds, as in the pilot.
- Evaluation set (seed 999) checked against training by hash: 0 overlaps.
- Steps-to-threshold recomputed from the raw evaluation logs of every run: identical to `metrics.json`.

## Findings

- **F1 — confirmatory (H1).** Median steps to 95% exact match: curriculum 4,200 (IQR 4,000–4,600) vs random 6,900 (IQR 6,700–7,300). One-sided Mann–Whitney U, p = 0.003; rank-biserial r = 0.78. Strength: strong. Evidence: `analysis/tables/steps_to_threshold.csv`, `analysis/figures/steps_to_threshold.pdf`. Caveats: one model size, one task.
- **F2 — exploratory (planned in protocol section 8).** Exact match on 9-digit addition after 20k steps: curriculum 31% (IQR 24–37) vs random 12% (IQR 8–15). Strength: moderate. Evidence: `analysis/tables/length_generalization.csv`. Caveats: exploratory; no multiplicity correction.
- **F3 — confirmatory (secondary measure).** Final in-distribution exact match at 20k steps: 99.6% vs 99.5%, two-sided Mann–Whitney U, p = 0.71. Strength: strong evidence of no practical difference. Evidence: `analysis/tables/final_accuracy.csv`.

## Candidate claims

- **C-01** — "Curriculum ordering reduced the median number of training steps needed to reach 95% exact match on up to 8-digit addition by 39% (4,200 vs 6,900 steps; 10 seeds per condition; one-sided Mann–Whitney p = 0.003)." — confirmatory — supported — evidence: `analysis/tables/steps_to_threshold.csv`
- **C-02** — "Curriculum-trained models generalized better to 9-digit addition (31% vs 12% exact match)." — exploratory — supported — evidence: `analysis/tables/length_generalization.csv`
- **C-03** — "Curriculum ordering improves final in-distribution accuracy." — confirmatory — not supported — evidence: `analysis/tables/final_accuracy.csv`

## Surprises and open questions

- The length-generalization gap (F2) is larger than the pilot suggested; it would need its own protocol to become a confirmatory result.
