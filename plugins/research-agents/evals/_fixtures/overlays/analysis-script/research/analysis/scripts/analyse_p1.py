"""Analysis of protocol P1: curriculum ordering vs random ordering.

Reads every ``<runs>/<run_id>/metrics.json``, refuses to mix code versions, and writes one
summary table per measure plus ``tests.csv`` to the output directory:

- steps_to_threshold.csv  — primary outcome (confirmatory, one-sided: curriculum lower)
- final_accuracy.csv      — secondary measure (confirmatory, two-sided)
- length_generalization.csv — 9-digit exact match (exploratory, descriptive only)

Usage::

    python analyse_p1.py --runs research/experiments/runs --out research/analysis/tables [--commit <sha>]
"""

from __future__ import annotations

import argparse
import csv
import json
from itertools import combinations
from pathlib import Path
from statistics import median, quantiles

CONDITIONS = ("curriculum", "random")
# measure -> (table file, test alternative or None for descriptive only, analysis label)
MEASURES = {
    "steps_to_threshold": ("steps_to_threshold.csv", "less", "confirmatory"),
    "final_exact_match": ("final_accuracy.csv", "two-sided", "confirmatory"),
    "exact_match_9digit": ("length_generalization.csv", None, "exploratory"),
}


def load_runs(runs_dir: Path, commit: str | None) -> tuple[list[dict], str]:
    """Return the runs of a single code version, failing loudly if versions are mixed."""
    runs = [json.loads(p.read_text()) for p in sorted(runs_dir.glob("*/metrics.json"))]
    if not runs:
        raise SystemExit(f"no metrics.json found under {runs_dir}")
    commits = sorted({run["commit"] for run in runs})
    if commit is None:
        if len(commits) > 1:
            raise SystemExit(f"runs come from several code versions {commits}: pass --commit")
        commit = commits[0]
    selected = [run for run in runs if run["commit"] == commit]
    if not selected:
        raise SystemExit(f"no runs at commit {commit}; found {commits}")
    return selected, commit


def midranks(values: list[float]) -> list[float]:
    """Ranks starting at 1, with tied values sharing the mean of their ranks."""
    order = sorted(values)
    rank_of: dict[float, float] = {}
    i = 0
    while i < len(order):
        j = i
        while j < len(order) and order[j] == order[i]:
            j += 1
        rank_of[order[i]] = (i + 1 + j) / 2
        i = j
    return [rank_of[v] for v in values]


def mann_whitney_exact(x: list[float], y: list[float], alternative: str) -> tuple[float, float, float]:
    """Exact permutation Mann–Whitney test on midranks.

    Returns (U of x, p-value, rank-biserial correlation). ``alternative="less"`` tests whether x
    tends to be lower than y. A positive rank-biserial correlation means x tends to be lower.
    """
    values = x + y
    ranks = midranks(values)
    n_x = len(x)
    observed = sum(ranks[:n_x])
    sums = [sum(ranks[i] for i in idx) for idx in combinations(range(len(values)), n_x)]
    if alternative == "less":
        p = sum(s <= observed + 1e-9 for s in sums) / len(sums)
    elif alternative == "two-sided":
        centre = n_x * (len(values) + 1) / 2
        p = sum(abs(s - centre) >= abs(observed - centre) - 1e-9 for s in sums) / len(sums)
    else:
        raise ValueError(f"unknown alternative: {alternative}")
    u = observed - n_x * (n_x + 1) / 2
    return u, p, 1 - 2 * u / (n_x * len(y))


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--runs", type=Path, required=True, help="directory holding <run_id>/metrics.json")
    parser.add_argument("--out", type=Path, required=True, help="directory for the CSV tables")
    parser.add_argument("--commit", help="code version to analyse (required if runs differ)")
    args = parser.parse_args()

    runs, commit = load_runs(args.runs, args.commit)
    args.out.mkdir(parents=True, exist_ok=True)
    tests = []
    for measure, (table, alternative, label) in MEASURES.items():
        if not all(measure in run for run in runs):
            continue
        samples = {c: [run[measure] for run in runs if run["condition"] == c] for c in CONDITIONS}
        with (args.out / table).open("w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow(["condition", "n", "median", "q1", "q3", "commit", "analysis"])
            for condition, sample in samples.items():
                q1, _, q3 = quantiles(sample, n=4, method="inclusive")
                writer.writerow([condition, len(sample), f"{median(sample):g}", f"{q1:g}", f"{q3:g}", commit, label])
        if alternative is not None:
            u, p, r = mann_whitney_exact(samples["curriculum"], samples["random"], alternative)
            tests.append([measure, label, "exact permutation Mann-Whitney", alternative, f"{u:g}", f"{p:.3g}", f"{r:.2f}"])
    with (args.out / "tests.csv").open("w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["measure", "analysis", "test", "alternative", "U_curriculum", "p", "rank_biserial_curriculum_lower"])
        writer.writerows(tests)
    print(f"{len(runs)} runs at commit {commit}; tables written to {args.out}")


if __name__ == "__main__":
    main()
