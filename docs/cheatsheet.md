# Global Cheat Sheet

Quick reference for the complete dev environment.

---

## Quick Start

```bash
# List available repos and sessions
dev

# Open a project (creates session with Claude Code + nvim + terminal)
dev ts-server

# Detach from session: Ctrl+a, d
# Reattach to session: dev ts-server
```

---

## Navigation (Unified with vim-tmux-navigator)

| Key | Context | Action |
|-----|---------|--------|
| `Ctrl+H` | tmux/nvim | Go left (pane or split) |
| `Ctrl+J` | tmux/nvim | Go down (pane or split) |
| `Ctrl+K` | tmux/nvim | Go up (pane or split) |
| `Ctrl+L` | tmux/nvim | Go right (pane or split) |

Smart detection: moves between nvim splits when inside nvim, tmux panes otherwise.

---

## tmux (Prefix: `Ctrl+a`)

### Essential

| Key | Action |
|-----|--------|
| `Ctrl+a, d` | Detach (leave session running) |
| `Ctrl+a, c` | New window |
| `Ctrl+a, x` | Kill pane |
| `Ctrl+a, z` | Toggle zoom (fullscreen pane) |
| `Ctrl+a, [` | Enter copy mode (vim keys) |
| `Ctrl+a, r` | Reload config |

### Splits

| Key | Action |
|-----|--------|
| `Ctrl+a, \|` | Split right (horizontal) |
| `Ctrl+a, -` | Split down (vertical) |
| `Ctrl+a, H/J/K/L` | Resize pane |

### Windows

| Key | Action |
|-----|--------|
| `Alt+H` | Previous window |
| `Alt+L` | Next window |
| `Alt+1-5` | Go to window 1-5 |

---

## Neovim (Leader: `Space`)

### Files

| Key | Action |
|-----|--------|
| `Space f` | Find files |
| `Space g` | Grep project |
| `Space b` | Open buffers |
| `Space r` | Recent files |
| `Space e` | File explorer |
| `Shift+H/L` | Prev/next buffer |

### Code

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover docs |
| `Space ca` | Code actions |
| `Space rn` | Rename |
| `Space cf` | Format |

### Jump (Flash)

| Key | Action |
|-----|--------|
| `s` | Jump anywhere (type chars, then label) |
| `S` | Select treesitter node |

### Git

| Key | Action |
|-----|--------|
| `Space gd` | Diff view (all changes) |
| `Space gh` | File history |
| `]h` / `[h` | Next/prev hunk |
| `Space hp` | Preview hunk |

### Edit

| Key | Action |
|-----|--------|
| `gc` | Comment |
| `vaf` | Select function |
| `vaa` | Select argument |
| `Space sr` | Search/replace file |
| `Space sR` | Search/replace project |

### Quick

| Key | Action |
|-----|--------|
| `Space w` | Save |
| `Space q` | Quit |
| `Esc` | Clear search |

---

## Ghostty

| Key | Action |
|-----|--------|
| `Cmd+N` | New window |
| `Cmd+T` | New tab |
| `Cmd++/-` | Font size |
| `Cmd+Shift+,` | Reload config |

---

## Vim Motions (Quick Reference)

### Movement

| Key | Action |
|-----|--------|
| `w/b` | Word forward/back |
| `e` | End of word |
| `0/$` | Start/end of line |
| `gg/G` | Start/end of file |
| `{/}` | Paragraph up/down |
| `Ctrl+d/u` | Half page down/up |
| `%` | Matching bracket |

### Actions

| Key | Action |
|-----|--------|
| `d` | Delete |
| `c` | Change |
| `y` | Yank (copy) |
| `v` | Visual select |
| `>/<` | Indent/unindent |

### Text Objects

| Key | Selects |
|-----|---------|
| `iw/aw` | Word |
| `i"/a"` | Quoted string |
| `i(/a(` | Parentheses |
| `i{/a{` | Braces |
| `if/af` | Function (mini.ai) |
| `ia/aa` | Argument (mini.ai) |

### Combos

| Key | Action |
|-----|--------|
| `ciw` | Change word |
| `di"` | Delete in quotes |
| `yap` | Yank paragraph |
| `vaf` | Select function |
| `>i{` | Indent in braces |

---

## Shell Aliases

| Alias | Action |
|-------|--------|
| `dev` | Launch tmux dev session |
| `g` | git |
| `k` | k9s (no splash) |
| `kmin` | Switch to minikube |
| `kctx` | Show current k8s context |
| `kctxs` | List all k8s contexts |

See `zsh/superpower/` for additional Superpower-specific aliases.

---

## Config Locations

| Tool | Location |
|------|----------|
| Zsh | `~/.zshrc` |
| Neovim | `~/.config/nvim/init.lua` |
| tmux | `~/.tmux.conf` |
| Ghostty | `~/Library/Application Support/com.mitchellh.ghostty/config` |
| tmux layouts | `~/.tmux/layouts/` |

---

## Troubleshooting

| Command | Purpose |
|---------|---------|
| `:Lazy` | nvim plugin manager |
| `:Mason` | nvim LSP installer |
| `:checkhealth` | nvim diagnostics |
| `tmux ls` | List tmux sessions |
| `tmux kill-server` | Kill all tmux |
