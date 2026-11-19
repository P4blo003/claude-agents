# Shared helpers for the eval scaffold scripts. Source this file from a case's fixture.sh; do not run it.
# Every function writes into the current directory, which is the run's empty workspace.

fixtures_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
plugin_dir="$(cd "$fixtures_dir/../.." && pwd)"
next_run=1

die() { echo "scaffold: $*" >&2; exit 1; }

[ -f "$plugin_dir/.claude-plugin/plugin.json" ] || die "plugin root not found from $fixtures_dir"

# The approved project: brief, decision log (D-001..D-003), protocol P1 and the protocol template.
base_project() {
  cp -R "$fixtures_dir/base/." .
  mkdir -p research/experiments research/analysis research/manuscript research/reviews
  cp "$plugin_dir/skills/research-lead/templates/PROTOCOL.md" research/design/PROTOCOL-TEMPLATE.md
}

# overlay <name>: copies _fixtures/overlays/<name>/ on top of the project.
overlay() {
  [ -d "$fixtures_dir/overlays/$1" ] || die "unknown overlay: $1"
  cp -R "$fixtures_dir/overlays/$1/." .
}

# runs_log: starts research/experiments/RUNS.md and writes the two run configs.
runs_log() {
  mkdir -p research/experiments/configs research/experiments/runs
  local cond
  for cond in random curriculum; do
    printf 'condition: %s\nsteps: 20000\neval_every: 100\n' "$cond" > "research/experiments/configs/$cond.yaml"
  done
  {
    echo '# Run log'
    echo
    echo '| run_id | date | commit | config | seed | duration | status | outputs |'
    echo '|---|---|---|---|---|---|---|---|'
  } > research/experiments/RUNS.md
}

# add_run <run_id> <commit> <condition> <seed> <completed|running> [steps_to_threshold]
add_run() {
  local id=$1 commit=$2 cond=$3 seed=$4 status=$5 steps=${6:-}
  local dir="research/experiments/runs/$id" duration='—'
  mkdir -p "$dir"
  cp "research/experiments/configs/$cond.yaml" "$dir/config.yaml"
  echo "python -m curriculum.train --config research/experiments/configs/$cond.yaml --seed $seed --out $dir" > "$dir/command.txt"
  case $status in
    completed)
      [ -n "$steps" ] || die "add_run $id: a completed run needs steps_to_threshold"
      duration='44m'
      printf '{"condition": "%s", "seed": %s, "commit": "%s", "steps_to_threshold": %s}\n' \
        "$cond" "$seed" "$commit" "$steps" > "$dir/metrics.json"
      echo 0 > "$dir/exit_code"
      ;;
    running)
      echo 48213 > "$dir/pid"
      printf 'step 6200 eval_exact_match 0.71\nstep 6300 eval_exact_match 0.73\n' > "$dir/train.log"
      ;;
    *) die "add_run $id: unknown status $status" ;;
  esac
  printf '| %s | 2026-11-05 | %s | configs/%s.yaml | %s | %s | %s | runs/%s/ |\n' \
    "$id" "$commit" "$cond" "$seed" "$duration" "$status" "$id" >> research/experiments/RUNS.md
}

# add_completed <commit> <condition> <seed>=<steps> ...   (run ids r01, r02, … in call order)
add_completed() {
  local commit=$1 cond=$2 pair
  shift 2
  for pair in "$@"; do
    add_run "$(printf 'r%02d' "$next_run")" "$commit" "$cond" "${pair%%=*}" completed "${pair#*=}"
    next_run=$((next_run + 1))
  done
}

# add_running <commit> <condition> <seed> ...
add_running() {
  local commit=$1 cond=$2 seed
  shift 2
  for seed in "$@"; do
    add_run "$(printf 'r%02d' "$next_run")" "$commit" "$cond" "$seed" running
    next_run=$((next_run + 1))
  done
}
