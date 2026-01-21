# Dotfiles

My development environment configuration for macOS.

## What's Included

- **Neovim** - Modern editor with LSP, Telescope, and AI completion
- **tmux** - Terminal multiplexer with session persistence
- **Ghostty** - Fast, GPU-accelerated terminal emulator
- **dev** - Smart session launcher for project switching

## Quick Start

```bash
# Clone this repo
git clone https://github.com/yourusername/dotfiles.git ~/repos/dotfiles
cd ~/repos/dotfiles

# Run install script
./install.sh
```

## Manual Installation

### Prerequisites

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install neovim tmux ripgrep fd

# Install Ghostty (download from https://ghostty.org)

# Install fonts (Berkeley Mono or your preferred Nerd Font)
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Neovim

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Create config directory and link
mkdir -p ~/.config/nvim
cp ~/repos/dotfiles/config/nvim/init.lua ~/.config/nvim/

# Open nvim to install plugins
nvim
# Plugins install automatically via lazy.nvim

# Install formatters
npm i -g prettier
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest
brew install stylua
```

### tmux

```bash
# Link config
cp ~/repos/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Create layouts directory
mkdir -p ~/.tmux/layouts
cp ~/repos/dotfiles/tmux/layouts/* ~/.tmux/layouts/
chmod +x ~/.tmux/layouts/*.sh

# Install plugin manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and install plugins
tmux
# Press: Ctrl+a then Shift+I
```

### Ghostty

```bash
# Create config directory
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty

# Copy config
cp ~/repos/dotfiles/config/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/
```

### Dev Command

```bash
# Add alias and SUPERPOWER_DIR to your shell (zsh example)
echo 'export SUPERPOWER_DIR="${SUPERPOWER_DIR:-$HOME/superpower}"' >> ~/.zshrc
echo 'alias dev="~/.tmux/layouts/dev.sh"' >> ~/.zshrc
source ~/.zshrc
```

Note: The install script automatically detects your shell (zsh/bash/fish) and adds these to the correct rc file.

## Usage

### Start a Dev Session

```bash
# List available repos and active sessions
dev

# Open a project (creates or attaches to session)
dev ts-server
dev react-app

# Switch between projects
dev ts-server    # Work on ts-server
Ctrl+a, d        # Detach
dev react-app   # Switch to react-app
dev ts-server    # Back to ts-server (preserved state)

# Kill a session
dev --kill ts-server
```

### Layout

```
┌──────────────┬─────────────────────────────┐
│              │       nvim (85%)            │
│ Claude Code  ├─────────────────────────────┤
│   (40%)      │      terminal (15%)         │
└──────────────┴─────────────────────────────┘
```

## Key Bindings

See [docs/cheatsheet.md](docs/cheatsheet.md) for the complete reference.

### Most Important

| Context | Key | Action |
|---------|-----|--------|
| All | `Ctrl+h/j/k/l` | Navigate panes |
| tmux | `Ctrl+a` | Prefix key |
| tmux | `Ctrl+a, d` | Detach session |
| nvim | `Space` | Leader key |
| nvim | `Space f` | Find files |
| nvim | `Space g` | Grep project |
| nvim | `s` | Flash jump |
| nvim | `Space gd` | Git diff view |

## Documentation

- [docs/nvim.md](docs/nvim.md) - Neovim configuration explained
- [docs/tmux.md](docs/tmux.md) - tmux configuration explained
- [docs/ghostty.md](docs/ghostty.md) - Ghostty configuration explained
- [docs/cheatsheet.md](docs/cheatsheet.md) - Global cheat sheet
- [docs/nvim-cheatsheet.md](docs/nvim-cheatsheet.md) - Neovim keybindings
- [docs/tmux-cheatsheet.md](docs/tmux-cheatsheet.md) - tmux keybindings
- [docs/ghostty-cheatsheet.md](docs/ghostty-cheatsheet.md) - Ghostty keybindings

## File Locations

| Config | Location |
|--------|----------|
| Neovim | `~/.config/nvim/init.lua` |
| tmux | `~/.tmux.conf` |
| tmux layouts | `~/.tmux/layouts/` |
| Ghostty | `~/Library/Application Support/com.mitchellh.ghostty/config` |
