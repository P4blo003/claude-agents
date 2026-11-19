# Results — P1 (curriculum ordering vs random ordering)

## Data analysed

- Code version: commit a1b2c3d — all 20 runs (r01–r20), 10 seeds per condition. No superseded runs.
- Run log: `research/experiments/RUNS.md`
- Tables produced by `python research/analysis/scripts/analyse_p1.py --runs research/experiments/runs --out research/analysis/tables`

## Sanity checks

- The random-ordering baseline reaches 95% exact match within the 20k-step budget in 10/10 seeds, as in the pilot.
- Evaluation set (seed 999) checked against training by hash: 0 overlaps.
- Steps-to-threshold read again from each run's `eval.log`: identical to its `metrics.json`.

## Findings

- **F1 — confirmatory (H1).** Median steps to 95% exact match: curriculum 6,100 (IQR 5,925–6,375) vs random 6,400 (IQR 6,225–6,650). Exact one-sided permutation Mann–Whitney U = 30.5, p = 0.074; rank-biserial r = 0.39. Strength: weak. H1 is not supported at the pre-registered α = 0.05. Evidence: `analysis/tables/steps_to_threshold.csv`, `analysis/tables/tests.csv`.
- **F2 — exploratory (planned in protocol section 8).** Median exact match on 9-digit addition after 20k steps: curriculum 30.5% (IQR 27.5–35.3) vs random 12.0% (IQR 9.3–13.8). Strength: moderate. Evidence: `analysis/tables/length_generalization.csv`. Caveats: exploratory and descriptive only; no test was run.
- **F3 — confirmatory (secondary measure).** Median final in-distribution exact match at 20k steps: 99.5% (IQR 99.5–99.6) in both conditions; exact two-sided permutation Mann–Whitney p = 0.87. Evidence: `analysis/tables/final_accuracy.csv`, `analysis/tables/tests.csv`.

## Candidate claims

- **C-01** — "Curriculum ordering reduces the number of training steps needed to reach 95% exact match." — confirmatory — not supported — evidence: `analysis/tables/steps_to_threshold.csv`, `analysis/tables/tests.csv`
- **C-02** — "Curriculum-trained models generalized better to 9-digit addition (median exact match 30.5% vs 12.0%)." — exploratory — supported — evidence: `analysis/tables/length_generalization.csv`

## Surprises and open questions

- The length-generalization gap was not expected and is not covered by any confirmatory analysis.
