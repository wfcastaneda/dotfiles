#!/bin/bash
# Smart dev session launcher
# Usage: dev [repo]     - Open repo from ~/superpower
#        dev            - List available repos / active sessions
#        dev --list     - List active sessions
#        dev --kill     - Kill a session

SUPERPOWER="$HOME/superpower"

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# List active sessions
list_sessions() {
    echo -e "${CYAN}Active sessions:${NC}"
    tmux ls 2>/dev/null || echo "  (none)"
    echo ""
}

# List available repos
list_repos() {
    echo -e "${CYAN}Available repos in ~/superpower:${NC}"
    ls -1 "$SUPERPOWER" | grep -v "^\." | while read repo; do
        # Check if session exists
        if tmux has-session -t "$repo" 2>/dev/null; then
            echo -e "  ${GREEN}$repo${NC} (active)"
        else
            echo "  $repo"
        fi
    done
    echo ""
}

# Show usage
usage() {
    echo -e "${CYAN}Usage:${NC}"
    echo "  dev <repo>     Open/attach to repo session"
    echo "  dev            List repos and sessions"
    echo "  dev --list     List active sessions only"
    echo "  dev --kill <n> Kill session"
    echo ""
    list_sessions
    list_repos
}

# Kill session
kill_session() {
    if [ -z "$1" ]; then
        echo "Specify session to kill: dev --kill <session>"
        list_sessions
        exit 1
    fi
    tmux kill-session -t "$1" 2>/dev/null && echo "Killed session: $1" || echo "Session not found: $1"
    exit 0
}

# Handle flags
case "$1" in
    "")
        usage
        exit 0
        ;;
    --list|-l)
        list_sessions
        exit 0
        ;;
    --kill|-k)
        kill_session "$2"
        ;;
    --help|-h)
        usage
        exit 0
        ;;
esac

# Get repo name
REPO="$1"
WORK_DIR="$SUPERPOWER/$REPO"

# Check if repo exists
if [ ! -d "$WORK_DIR" ]; then
    echo -e "${YELLOW}Repo not found:${NC} $REPO"
    echo ""
    list_repos
    exit 1
fi

SESSION="$REPO"

# Check if session already exists
if tmux has-session -t "$SESSION" 2>/dev/null; then
    echo -e "${GREEN}Attaching to existing session:${NC} $SESSION"
    tmux attach -t "$SESSION"
    exit 0
fi

echo -e "${GREEN}Creating new session:${NC} $SESSION"

# Get terminal dimensions
TERM_WIDTH=$(tput cols)
TERM_HEIGHT=$(tput lines)

# Create new session with known size
tmux new-session -d -s "$SESSION" -c "$WORK_DIR" -x "$TERM_WIDTH" -y "$TERM_HEIGHT"

# Split: new pane on RIGHT gets 60% width (left keeps 40% for Claude Code)
tmux split-window -t "$SESSION:1" -h -p 60 -c "$WORK_DIR"

# Split the right pane: bottom gets 10% for terminal
tmux split-window -t "$SESSION:1" -v -p 10 -c "$WORK_DIR"

# Move up to right-top pane and start nvim (no args = shows dashboard)
tmux select-pane -t "$SESSION:1" -U
tmux send-keys "nvim" Enter

# Select left pane and start Claude Code in the repo
tmux select-pane -t "$SESSION:1" -L
tmux send-keys "cd $WORK_DIR && clear && claude" Enter

# Rename window to repo name
tmux rename-window -t "$SESSION:1" "$REPO"

# Attach
tmux attach -t "$SESSION"
