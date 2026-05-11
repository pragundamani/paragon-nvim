# Paragon Neovim Config

A portable [LazyVim](https://github.com/LazyVim/LazyVim)-based Neovim config focused on:

- markdown and Obsidian note-taking
- custom checklist workflows
- LaTeX note rendering
- fast build/run commands for small code projects
- a dark custom colorscheme: `pitchblack_neon`

## Install

Backup any existing config first:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Clone this repo into place:

```bash
git clone https://github.com/USER/REPO.git ~/.config/nvim
```

Then start Neovim:

```bash
nvim
```

`lazy.nvim` will bootstrap automatically and install plugins.

## Requirements

- Neovim `>= 0.10`
- `git`
- `ripgrep`
- a Nerd Font

## Optional Dependencies

These are only needed for specific features.

### Markdown / PDF / image rendering

- `kitty` or `ghostty`
- `ImageMagick`
- `Ghostscript`
- `poppler-utils`

### Obsidian image paste

Linux:

- X11: `xclip`
- Wayland: `wl-clipboard`

## What Is Included

### Notes workflow

- `obsidian.nvim` for vault navigation and note actions
- `autolist.nvim` for list continuation and custom checklist states
- `render-markdown.nvim` for rendered markdown checkboxes and note UI
- `nabla.nvim` for LaTeX previews in markdown/tex

### Utility workflow

- smart build commands for file and project builds
- PDF reading inside Neovim
- custom `pitchblack_neon` colorscheme

## Key Features

### Build keys

- `<C-A-b>` smart build target
- `<C-A-n>` build/run current file
- `<C-A-N>` build current project folder

Commands:

- `:Build`
- `:BuildFile`
- `:BuildFolder`

### Markdown keys

- `<leader>a` autolist group
- `<leader>ak` checklist states group
- `<leader>ax` toggle plain checkbox
- `<leader>ar` renumber list
- `<leader>an` / `<leader>ap` cycle list marker type
- `<leader>le` / `<leader>ld` enable or disable markdown rendering
- `<leader>lp` / `<leader>lv` / `<leader>lr` LaTeX tools

### Obsidian keys

- `<leader>o` obsidian group
- `<leader>oo` open in Obsidian app
- `<leader>ot` today note
- `<leader>on` new note
- `<leader>oq` quick switch
- `<leader>os` search notes
- `<leader>ob` backlinks
- `<leader>ol` links in current note
- `<leader>ow` switch workspace
- `<leader>op` paste image
- `<leader>oc` table of contents

## Checklist States

This config supports custom one-character checklist states for both Neovim rendering and Obsidian CSS snippets:

- `[a]` appointment
- `[.]` event
- `[>]` reschedule
- `[<]` delegate
- `[-]` note
- `[R]` rush
- `[$]` payment
- `[i]` idea
- `[s]` schedule
- `[m]` contact
- `[?]` lookup
- `[t]` travel
- `[w]` work
- `[=]` study
- `[p]` pending
- `[~]` cancel
- `[!]` important
- `[/]` work in progress
- `[x]` done
- `[o]` vis
- `[c]` call
- `[S]` send
- `[u]` upload
- `[d]` download
- `[b]` buy
- `[f]` future

## Health Checks

Useful commands after install:

- `:Lazy`
- `:checkhealth`
- `:checkhealth obsidian`
- `:messages`

## License

Apache 2.0. See `LICENSE`.
