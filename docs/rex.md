# Rex Configuration

Location: `~/.config/rex/init.lua` (linked to `config/rex/init.lua`)

## Overview

Rex is a terminal multiplexer with a native macOS app. A server owns the
sessions, tabs, and panes. The app, the CLI, and agents are clients of that
server. Configuration is one Lua file. Rex does not watch the file, so reload
it after each change:

```sh
rex config reload
rex config check   # report problems without a reload
rex keymap         # show the bindings the server loaded
```

Theme, font, tab style, and notification settings live in the app. They are
not in `init.lua` yet.

## Keys

The app keeps its default shortcuts. The config adds one set:

| Key | Action |
|-----|--------|
| `Ctrl+H/J/K/L` | Focus the pane to the left, below, above, or right |

Useful defaults:

| Key | Action |
|-----|--------|
| `Cmd+Shift+P` | Command palette |
| `Cmd+K` | Change session |
| `Cmd+D` / `Cmd+Shift+D` | Split right / split down |
| `Cmd+Shift+Enter` | Zoom or restore the pane |
| `Cmd+.` | Show activity |

## Actions

Run an action from the palette by its title, or from the CLI by its name.

| Name | Title | What it does |
|------|-------|--------------|
| `workbench` | Open Superpower Workbench | Opens a `dev` tab with devbox, the four frontends, ts-server, and ts-ai-chat |

```sh
rex do workbench
```

From the palette, the new tab opens in front. From the CLI, the switch to the
new tab needs Remote Control on in the app (Settings => Rex Server). Without
it, the tab is still created and the command reports the failed switch.

The devbox pane has `make core/up && lzd` typed in. Press Enter to run it.
Set `SUPERPOWER_DIR` to use a checkout other than `~/superpower`.

## Agents

`rex skill setup` installs the Rex skill and a session-start hook for Claude
Code and Codex. The hook lives in `~/.claude/settings.json`, which this repo
does not track. Run `rex skill status` to see what is installed.

## Terminfo

`rex terminfo setup` installs the `xterm-rex` terminfo entry and an ssh guard.
The guard writes `ssh_config` and `terminfo-hosts` into `~/.config/rex` and
adds an `Include` line to `~/.ssh/config`. Those files are machine-specific,
so `config/rex/.gitignore` keeps them out of the repo. Run the setup once on
each machine. Terminals opened after the setup get `TERM=xterm-rex`.
