# tmux Configuration

Location: `~/.tmux.conf`

## Overview

A minimal tmux setup with vim-style navigation, mouse support, and session persistence. Designed to work seamlessly with Ghostty and Neovim.

## Key Design Decisions

### Prefix Key: `Ctrl+a`
Changed from default `Ctrl+b` for easier reach. Press `Ctrl+a`, release, then press the next key.

### Vim-Style Navigation
- Pane navigation: `Ctrl+h/j/k/l` (no prefix needed)
- Copy mode: vi keybindings
- Resize panes: `Prefix + H/J/K/L`

### True Color Support
Configured for 256 colors and RGB true color, matching Ghostty's capabilities.

## Core Settings

| Setting | Value | Purpose |
|---------|-------|---------|
| Prefix | `Ctrl+a` | Easier than default `Ctrl+b` |
| Base index | 1 | Windows/panes start at 1, not 0 |
| Mouse | Enabled | Click to focus, scroll, resize |
| Escape time | 0 | No delay for vim escape key |
| History limit | 50000 | Large scrollback buffer |

## Plugins

Managed by TPM (Tmux Plugin Manager):

| Plugin | Purpose |
|--------|---------|
| tpm | Plugin manager |
| tmux-resurrect | Save/restore sessions |
| tmux-continuum | Auto-save sessions every 15 min |

### Installing Plugins

First time setup: `Prefix + Shift+I` (capital I)

## Status Bar

Minimal design:
- **Left**: Session name in blue
- **Right**: Time (HH:MM)
- **Windows**: Current window highlighted in cyan

## Layout Script

Location: `~/.tmux/layouts/superpower.sh`

Creates a 3-pane development layout:
```
┌──────────────┬─────────────────────────────┐
│              │       nvim (85%)            │
│ Claude Code  ├─────────────────────────────┤
│   (40%)      │      terminal (15%)         │
└──────────────┴─────────────────────────────┘
```

Run with: `~/.tmux/layouts/superpower.sh`

## Session Management

Sessions persist across terminal restarts thanks to tmux-resurrect and tmux-continuum.

| Command | Purpose |
|---------|---------|
| `tmux` | Start new session |
| `tmux attach` | Reattach to last session |
| `tmux attach -t name` | Attach to named session |
| `tmux ls` | List sessions |
| `tmux kill-session -t name` | Kill a session |

## Customization

Edit `~/.tmux.conf` then reload with `Prefix + r`.

### Adding New Layouts

Create scripts in `~/.tmux/layouts/`:

```bash
#!/bin/bash
SESSION="myproject"
WORK_DIR="$HOME/path/to/project"

tmux kill-session -t $SESSION 2>/dev/null
tmux new-session -d -s $SESSION -c $WORK_DIR

# Add splits...
tmux split-window -h -p 50 -c $WORK_DIR

tmux attach -t $SESSION
```

Make executable: `chmod +x ~/.tmux/layouts/myproject.sh`
