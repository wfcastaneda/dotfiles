# Ghostty Configuration

Location: `~/Library/Application Support/com.mitchellh.ghostty/config`

## Overview

Ghostty is a fast, GPU-accelerated terminal emulator. This configuration provides a minimal dark aesthetic with native macOS integration.

## Visual Theme

### Colors
- **Background**: Pure black (`#000000`) with 80% opacity
- **Foreground**: Light gray (`#e8ecf2`)
- **Cursor**: Blue (`#2f81f7`), block style, no blink
- **Selection**: Dark blue background (`#304e75`)

### Font
- **Family**: Berkeley Mono
- **Size**: 13pt

### ANSI Color Palette

| Color | Normal | Bright |
|-------|--------|--------|
| Black | `#494e56` | `#6f7781` |
| Red | `#ee8297` | `#f2a5b4` |
| Green | `#64b65f` | `#79d171` |
| Yellow | `#ddb53e` | `#dbb556` |
| Blue | `#6da5f9` | `#89bef9` |
| Magenta | `#b58ef8` | `#cba9f9` |
| Cyan | `#66c2cd` | `#79d3db` |
| White | `#b3bac3` | `#ffffff` |

## Window Settings

| Setting | Value | Purpose |
|---------|-------|---------|
| Padding | 8px | Minimal breathing room |
| Save state | Always | Remember window size/position |
| Confirm close | Disabled | No prompt when closing |
| Quit after last | Yes | Exit app when last window closes |

## Shell Integration

- **Detection**: Automatic
- **Features**: Cursor tracking, sudo integration, title updates

## Keybindings

No custom keybindings are configured. Use tmux for all split/pane management to avoid keybinding collisions and benefit from session persistence.

## Performance

- Scrollback: 10,000 lines
- GPU-accelerated rendering
- Native macOS window chrome

## Customization

Edit the config file and restart Ghostty, or press `Cmd+Shift+,` to reload.

### Config Format

```
# Comments start with #
key = value
```

### Common Customizations

```bash
# Change font size
font-size = 14

# Adjust opacity (0.0 to 1.0)
background-opacity = 0.9

# Different theme
background = 1a1b26
foreground = c0caf5

# Disable ligatures
font-feature = -liga
```

## Relationship with tmux

Ghostty is used purely as the terminal emulator. All split/pane management is handled by tmux, which provides:

- Session persistence (survives restart)
- Detach/reattach capability
- Remote session support
- Scripted layouts (see `dev.sh`)
