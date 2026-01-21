#!/bin/bash
# Dotfiles installer

set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}Installing dotfiles from:${NC} $DOTFILES"
echo ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Install it first:${NC}"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

# Install dependencies
echo -e "${CYAN}Installing dependencies...${NC}"
brew install neovim tmux ripgrep fd 2>/dev/null || true

# Neovim
echo -e "${CYAN}Setting up Neovim...${NC}"
mkdir -p ~/.config/nvim
if [ -f ~/.config/nvim/init.lua ] && [ ! -L ~/.config/nvim/init.lua ]; then
    echo -e "${YELLOW}Backing up existing nvim config...${NC}"
    mv ~/.config/nvim/init.lua ~/.config/nvim/init.lua.backup.$(date +%s)
fi
ln -sf "$DOTFILES/config/nvim/init.lua" ~/.config/nvim/init.lua
echo -e "${GREEN}✓ Neovim config linked${NC}"

# tmux
echo -e "${CYAN}Setting up tmux...${NC}"
if [ -f ~/.tmux.conf ] && [ ! -L ~/.tmux.conf ]; then
    echo -e "${YELLOW}Backing up existing tmux config...${NC}"
    mv ~/.tmux.conf ~/.tmux.conf.backup.$(date +%s)
fi
ln -sf "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.tmux/layouts
ln -sf "$DOTFILES/tmux/layouts/dev.sh" ~/.tmux/layouts/dev.sh
ln -sf "$DOTFILES/tmux/layouts/superpower.sh" ~/.tmux/layouts/superpower.sh
echo -e "${GREEN}✓ tmux config linked${NC}"

# TPM (tmux plugin manager)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo -e "${CYAN}Installing tmux plugin manager...${NC}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo -e "${GREEN}✓ TPM installed${NC}"
else
    echo -e "${GREEN}✓ TPM already installed${NC}"
fi

# Ghostty
echo -e "${CYAN}Setting up Ghostty...${NC}"
GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
mkdir -p "$GHOSTTY_DIR"
if [ -f "$GHOSTTY_DIR/config" ] && [ ! -L "$GHOSTTY_DIR/config" ]; then
    echo -e "${YELLOW}Backing up existing Ghostty config...${NC}"
    mv "$GHOSTTY_DIR/config" "$GHOSTTY_DIR/config.backup.$(date +%s)"
fi
ln -sf "$DOTFILES/config/ghostty/config" "$GHOSTTY_DIR/config"
echo -e "${GREEN}✓ Ghostty config linked${NC}"

# Dev alias
echo -e "${CYAN}Setting up dev command...${NC}"
if ! grep -q 'alias dev=' ~/.zshrc 2>/dev/null; then
    echo 'alias dev="~/.tmux/layouts/dev.sh"' >> ~/.zshrc
    echo -e "${GREEN}✓ dev alias added to ~/.zshrc${NC}"
else
    echo -e "${GREEN}✓ dev alias already exists${NC}"
fi

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Installation complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${CYAN}Next steps:${NC}"
echo "1. Restart your terminal (or run: source ~/.zshrc)"
echo "2. Open nvim to install plugins: nvim"
echo "3. Start tmux and install plugins: tmux, then Ctrl+a Shift+I"
echo "4. Install formatters:"
echo "   npm i -g prettier"
echo "   go install mvdan.cc/gofumpt@latest"
echo "   go install golang.org/x/tools/cmd/goimports@latest"
echo "   brew install stylua"
echo ""
echo -e "${CYAN}Usage:${NC}"
echo "  dev              # List repos and sessions"
echo "  dev ts-server    # Open project session"
echo ""
