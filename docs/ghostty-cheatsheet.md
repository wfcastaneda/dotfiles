# Ghostty Cheat Sheet

## Window Management

| Key | Action |
|-----|--------|
| `Cmd+N` | New window |
| `Cmd+T` | New tab |
| `Cmd+W` | Close tab/pane |
| `Cmd+Shift+W` | Close window |

## Native Splits

| Key | Action |
|-----|--------|
| `Cmd+D` | Split right |
| `Cmd+Shift+T` | Split down |
| `Ctrl+H` | Go to left split |
| `Ctrl+J` | Go to bottom split |
| `Ctrl+K` | Go to top split |
| `Ctrl+L` | Go to right split |

**Note**: With tmux, use tmux splits instead (they persist across restarts).

## Tabs

| Key | Action |
|-----|--------|
| `Cmd+1-9` | Go to tab 1-9 |
| `Cmd+Shift+[` | Previous tab |
| `Cmd+Shift+]` | Next tab |

## Text

| Key | Action |
|-----|--------|
| `Cmd+C` | Copy |
| `Cmd+V` | Paste |
| `Cmd+A` | Select all |
| `Cmd+K` | Clear screen |

## Font Size

| Key | Action |
|-----|--------|
| `Cmd++` | Increase font |
| `Cmd+-` | Decrease font |
| `Cmd+0` | Reset font size |

## Config

| Key | Action |
|-----|--------|
| `Cmd+Shift+,` | Reload config |

## Config File Location

```
~/Library/Application Support/com.mitchellh.ghostty/config
```

## Quick Settings

Edit config file:

```bash
# Font
font-family = Berkeley Mono
font-size = 13

# Opacity
background-opacity = 0.8

# Padding
window-padding-x = 8
window-padding-y = 8
```
