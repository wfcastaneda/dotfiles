#!/bin/bash
# Superpower monorepo layout
# LEFT: Claude Code (40% width, full height)
# RIGHT TOP: nvim (60% width, 85% height)
# RIGHT BOTTOM: terminal (60% width, 15% height)

SESSION="superpower"
WORK_DIR="$HOME/superpower"

# Kill existing session if it exists
tmux kill-session -t $SESSION 2>/dev/null

# Create session
tmux new-session -d -s $SESSION -c $WORK_DIR -x "$(tput cols)" -y "$(tput lines)"

# Rename window
tmux rename-window -t $SESSION:1 'dev'

# Split right (60%), focus moves to new right pane
tmux split-window -t $SESSION:1 -h -p 60 -c $WORK_DIR

# Split the right pane down (15% for bottom), focus moves to bottom pane
tmux split-window -t $SESSION:1 -v -p 15 -c $WORK_DIR

# Now: pane layout is left(0), right-top(1), right-bottom(2)
# We're currently in right-bottom (2)

# Move up to right-top pane and start nvim
tmux select-pane -t $SESSION:1 -U
tmux send-keys 'nvim .' Enter

# Select left pane for Claude Code
tmux select-pane -t $SESSION:1 -L

# Attach
tmux attach -t $SESSION
