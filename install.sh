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

# Parse arguments
LINK_MODE=false
for arg in "$@"; do
    case $arg in
        --link)
            LINK_MODE=true
            ;;
    esac
done

# Helper function to install a config
install_config() {
    local name="$1"
    local src="$2"
    local dest="$3"
    local dest_dir="$(dirname "$dest")"

    echo -e "${CYAN}Setting up ${name}...${NC}"
    mkdir -p "$dest_dir"

    if [ -f "$dest" ] && [ ! -L "$dest" ]; then
        echo -e "${YELLOW}Backing up existing ${name} config...${NC}"
        mv "$dest" "$dest.backup.$(date +%s)"
    fi

    if [ "$LINK_MODE" = true ]; then
        ln -sf "$src" "$dest"
        echo -e "${GREEN}✓ ${name} config linked${NC}"
    else
        cp "$src" "$dest"
        echo -e "${GREEN}✓ ${name} config copied${NC}"
    fi
}

echo -e "${CYAN}Installing dotfiles from:${NC} $DOTFILES"
if [ "$LINK_MODE" = true ]; then
    echo -e "${YELLOW}Mode: symlink (changes to repo will be reflected)${NC}"
else
    echo -e "${YELLOW}Mode: copy (use --link for symlinks)${NC}"
fi
echo ""

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Install it first:${NC}"
    echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
fi

# Install dependencies
echo -e "${CYAN}Installing dependencies...${NC}"
if ! brew install neovim tmux ripgrep fd; then
    echo -e "${RED}Warning: Some brew packages may have failed to install${NC}"
fi

# Neovim
install_config "Neovim" "$DOTFILES/config/nvim/init.lua" ~/.config/nvim/init.lua

# tmux
install_config "tmux" "$DOTFILES/tmux/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.tmux/layouts
install_config "tmux dev layout" "$DOTFILES/tmux/layouts/dev.sh" ~/.tmux/layouts/dev.sh
install_config "tmux superpower layout" "$DOTFILES/tmux/layouts/superpower.sh" ~/.tmux/layouts/superpower.sh

# TPM (tmux plugin manager)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo -e "${CYAN}Installing tmux plugin manager...${NC}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo -e "${GREEN}✓ TPM installed${NC}"
else
    echo -e "${GREEN}✓ TPM already installed${NC}"
fi

# Ghostty
GHOSTTY_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
install_config "Ghostty" "$DOTFILES/config/ghostty/config" "$GHOSTTY_DIR/config"

# Karabiner
install_config "Karabiner" "$DOTFILES/config/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json

# Claude Code
install_config "Claude Code" "$DOTFILES/claude/settings.local.json" ~/.claude/settings.local.json

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Installation complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${CYAN}Next steps:${NC}"
echo "1. Set up Zsh config (choose one):"
echo "   a) Copy:    cp $DOTFILES/zsh/.zshrc ~/.zshrc"
echo "   b) Symlink: ln -sf $DOTFILES/zsh/.zshrc ~/.zshrc"
echo ""
echo "2. Set up local overrides:"
echo "   cp $DOTFILES/zsh/superpower/local.zsh.example ~/.zshrc.local"
echo "   # Edit ~/.zshrc.local with your K8S context URLs"
echo ""
echo "3. Restart your terminal (or run: source ~/.zshrc)"
echo ""
echo "4. Open nvim to install plugins: nvim"
echo ""
echo "5. Start tmux and install plugins: tmux, then Ctrl+a Shift+I"
echo ""
echo "6. Install formatters:"
echo "   npm i -g prettier"
echo "   go install mvdan.cc/gofumpt@latest"
echo "   go install golang.org/x/tools/cmd/goimports@latest"
echo "   brew install stylua"
echo ""
echo -e "${CYAN}Usage:${NC}"
echo "  dev              # List repos and sessions"
echo "  dev ts-server    # Open project session"
echo ""
