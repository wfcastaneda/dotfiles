# tmux Cheat Sheet

Prefix: `Ctrl+a` (press, release, then next key)

## Sessions

| Key/Command | Action |
|-------------|--------|
| `tmux` | Start new session |
| `tmux new -s name` | New named session |
| `tmux attach` | Attach to last session |
| `tmux attach -t name` | Attach to named session |
| `tmux ls` | List sessions |
| `tmux kill-session -t name` | Kill session |
| `Prefix + d` | Detach from session |

## Windows (Tabs)

| Key | Action |
|-----|--------|
| `Prefix + c` | New window |
| `Prefix + ,` | Rename window |
| `Prefix + w` | List windows |
| `Prefix + n` | Next window |
| `Prefix + p` | Previous window |
| `Alt+H` | Previous window |
| `Alt+L` | Next window |
| `Alt+1-5` | Go to window 1-5 |
| `Prefix + &` | Kill window |

## Panes

### Create

| Key | Action |
|-----|--------|
| `Prefix + \|` | Split right (horizontal) |
| `Prefix + -` | Split down (vertical) |

### Navigate (No Prefix!)

| Key | Action |
|-----|--------|
| `Ctrl+H` | Go left |
| `Ctrl+J` | Go down |
| `Ctrl+K` | Go up |
| `Ctrl+L` | Go right |

### Resize

| Key | Action |
|-----|--------|
| `Prefix + H` | Resize left |
| `Prefix + J` | Resize down |
| `Prefix + K` | Resize up |
| `Prefix + L` | Resize right |

### Manage

| Key | Action |
|-----|--------|
| `Prefix + x` | Kill pane |
| `Prefix + X` | Kill window |
| `Prefix + z` | Toggle zoom (fullscreen pane) |
| `Prefix + !` | Convert pane to window |
| `Prefix + q` | Show pane numbers |

## Copy Mode

| Key | Action |
|-----|--------|
| `Prefix + [` | Enter copy mode |
| `v` | Start selection (in copy mode) |
| `y` | Copy selection (in copy mode) |
| `Enter` | Copy selection (in copy mode) |
| `q` | Exit copy mode |

In copy mode, use vim keys: `h/j/k/l`, `w/b`, `/search`, etc.

## Misc

| Key | Action |
|-----|--------|
| `Prefix + r` | Reload config |
| `Prefix + ?` | List all keybindings |
| `Prefix + t` | Show clock |
| `Prefix + Shift+I` | Install plugins |
| `Prefix + Shift+U` | Update plugins |

## Dev Sessions

| Command | Action |
|---------|--------|
| `dev` | List repos and active sessions |
| `dev <repo>` | Create/attach to project session |
| `dev --kill <name>` | Kill a session |

## Session Persistence

Sessions auto-save every 15 minutes. To manually:

| Key | Action |
|-----|--------|
| `Prefix + Ctrl+s` | Save session |
| `Prefix + Ctrl+r` | Restore session |
