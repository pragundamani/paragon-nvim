#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"

if [[ ! -d "$CONFIG_DIR" ]]; then
  printf 'Expected config at %s\n' "$CONFIG_DIR" >&2
  printf 'Clone the repo there first, then rerun this script.\n' >&2
  exit 1
fi

printf 'Setting up Paragon Neovim config at %s\n' "$CONFIG_DIR"
printf '\n'
printf 'When entering vault paths, you can press Tab for shell path completion.\n'
printf '\n'

"$CONFIG_DIR/scripts/setup-obsidian.sh"

printf '\nInstalling/updating plugins...\n'
nvim --headless "+Lazy! sync" +qa

printf '\nInstall complete. Launch Neovim with: nvim\n'
