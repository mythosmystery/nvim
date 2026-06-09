#!/usr/bin/env bash
set -euo pipefail

LAZY_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy"
NVIM_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

echo "Repairing corrupted lazy.nvim plugin clones in: $LAZY_DIR"

broken=()
for dir in "$LAZY_DIR"/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  if ! git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    broken+=("$name")
  fi
done

if ((${#broken[@]} == 0)); then
  echo "No broken plugin clones found."
else
  echo "Removing ${#broken[@]} broken plugin(s):"
  printf '  - %s\n' "${broken[@]}"
  for name in "${broken[@]}"; do
    rm -rf "$LAZY_DIR/$name"
  done
fi

if [ -f "$NVIM_CONFIG/lazy-lock.json" ] && [ ! -s "$NVIM_CONFIG/lazy-lock.json" ]; then
  echo "Removing empty lazy-lock.json"
  rm -f "$NVIM_CONFIG/lazy-lock.json"
fi

echo "Reinstalling plugins..."
nvim --headless "+Lazy! sync" +qa

if [ -s "$NVIM_CONFIG/lazy-lock.json" ]; then
  echo "Done. lazy-lock.json regenerated ($(wc -c <"$NVIM_CONFIG/lazy-lock.json") bytes)."
else
  echo "Warning: lazy-lock.json was not created. Open nvim and run :Lazy sync manually."
  exit 1
fi
