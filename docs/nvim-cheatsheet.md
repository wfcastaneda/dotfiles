# Neovim Cheat Sheet

Leader key: `Space`

## File Navigation

| Key | Action |
|-----|--------|
| `<leader>f` | Find files (Telescope) |
| `<leader>g` | Grep in project |
| `<leader>b` | Open buffers |
| `<leader>r` | Recent files |
| `<leader>/` | Search in current buffer |
| `<leader>e` | Toggle file explorer |
| `<leader>o` | Focus file explorer |

## Buffers

| Key | Action |
|-----|--------|
| `Shift+H` | Previous buffer |
| `Shift+L` | Next buffer |
| `<leader>bp` | Pin buffer |
| `<leader>bo` | Close other buffers |

## LSP (Code Intelligence)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Show diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>s` | Document symbols |
| `<leader>fd` | All diagnostics |
| `<leader>ih` | Toggle inlay hints |

## Flash (Jump Navigation)

| Key | Action |
|-----|--------|
| `s` | Flash jump (type chars, then label) |
| `S` | Flash treesitter (select node) |
| `r` | Remote flash (operator pending) |

## Search & Replace

| Key | Action |
|-----|--------|
| `<leader>sr` | Search/replace in current file |
| `<leader>sR` | Search/replace in project |

## Git

| Key | Action |
|-----|--------|
| `<leader>gd` | Open diff view (all changes) |
| `<leader>gh` | Current file history |
| `<leader>gH` | Branch history |
| `<leader>gq` | Close diff view |
| `]h` | Next hunk |
| `[h` | Previous hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |

## Diagnostics

| Key | Action |
|-----|--------|
| `<leader>xx` | Toggle diagnostics list |
| `<leader>xd` | Buffer diagnostics |

## Editing

| Key | Action |
|-----|--------|
| `gc` | Comment (visual/motion) |
| `gcc` | Comment line |
| `<leader>cf` | Format buffer |
| `<leader>p` | Paste without losing yank |

## Text Objects (mini.ai)

Use with `v`, `d`, `c`, `y`:

| Key | Selects |
|-----|---------|
| `af` / `if` | Around/inside function |
| `ac` / `ic` | Around/inside class |
| `aa` / `ia` | Around/inside argument |
| `ao` / `io` | Around/inside block/loop |

## Surround

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | Add surround |
| `ds{char}` | Delete surround |
| `cs{old}{new}` | Change surround |

## Window/Split Navigation

| Key | Action |
|-----|--------|
| `Ctrl+H` | Navigate left (split or tmux pane) |
| `Ctrl+J` | Navigate down (split or tmux pane) |
| `Ctrl+K` | Navigate up (split or tmux pane) |
| `Ctrl+L` | Navigate right (split or tmux pane) |

## General

| Key | Action |
|-----|--------|
| `<leader>w` | Save |
| `<leader>q` | Quit |
| `Esc` | Clear search highlight |
| `Ctrl+D` | Page down (centered) |
| `Ctrl+U` | Page up (centered) |
| `J` (visual) | Move lines down |
| `K` (visual) | Move lines up |

## Commands

| Command | Purpose |
|---------|---------|
| `:Lazy` | Plugin manager |
| `:Mason` | LSP installer |
| `:ConformInfo` | Formatter status |
| `:checkhealth` | Diagnose issues |
