#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
LOCAL_CONFIG="$CONFIG_DIR/lua/config/local.lua"

mkdir -p "$CONFIG_DIR/lua/config"

read -r -p "Primary vault name [personal]: " primary_name
primary_name=${primary_name:-personal}

read -r -p "Primary vault path [~/notes/personal]: " primary_path
primary_path=${primary_path:-~/notes/personal}

read -r -p "Second vault name [studies]: " second_name
second_name=${second_name:-studies}

read -r -p "Second vault path [~/notes/studies]: " second_path
second_path=${second_path:-~/notes/studies}

read -r -p "Default notes subdir [01 Inbox]: " notes_subdir
notes_subdir=${notes_subdir:-01 Inbox}

cat > "$LOCAL_CONFIG" <<EOF
return {
  obsidian = {
    workspaces = {
      { name = "$primary_name", path = "$primary_path" },
      { name = "$second_name", path = "$second_path" },
    },
    notes_subdir = "$notes_subdir",
  },
}
EOF

printf 'Wrote %s\n' "$LOCAL_CONFIG"
printf 'Restart Neovim or run :Lazy reload obsidian.nvim\n'
