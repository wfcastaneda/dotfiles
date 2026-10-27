# =============================================================================
# PATH
# =============================================================================

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.bun/bin:$PATH"

# =============================================================================
# ENVIRONMENT
# =============================================================================

export XDG_CONFIG_HOME="$HOME/.config"
export KDASH_CONFIG="$XDG_CONFIG_HOME/kdash/config.yaml"

# =============================================================================
# NVM (Node Version Manager)
# =============================================================================

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# =============================================================================
# COMPLETIONS
# =============================================================================

# Docker CLI completions
fpath=($HOME/.docker/completions $fpath)

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

autoload -Uz compinit
compinit

# =============================================================================
# PROMPT
# =============================================================================

autoload -U add-zsh-hook

get_git_info() {
  if git rev-parse --git-dir >/dev/null 2>&1; then
    local branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
      local color="green"
      if [[ "$branch" == "main" ]] || [[ "$branch" == "master" ]]; then
        color="red"
      fi
      echo "(%F{$color}$branch%F{white})"
    fi
  fi
}

get_kube_info() {
  if command -v kubectl >/dev/null 2>&1; then
    local context=$(kubectl config current-context 2>/dev/null)
    if [ -n "$context" ]; then
      local namespace=$(kubectl config view --minify --output "jsonpath={..namespace}" 2>/dev/null)
      [ -z "$namespace" ] && namespace="default"

      # Extract cluster name from ARN (arn:aws:eks:region:account:cluster/name -> name)
      local display_context="${context##*/}"

      # Color coding: blue=dev, yellow=staging, red=production
      local context_color="blue"
      if [[ "$context" == *"staging"* ]] || [[ "$context" == *"stg"* ]]; then
        context_color="yellow"
      elif [[ "$context" != *"minikube"* ]] && [[ "$context" != *"local"* ]]; then
        context_color="red"
      fi

      local namespace_color="blue"
      if [[ "$namespace" == *"stg"* ]] || [[ "$namespace" == *"staging"* ]]; then
        namespace_color="yellow"
      elif [[ "$namespace" == *"prd"* ]] || [[ "$namespace" == *"production"* ]]; then
        namespace_color="red"
      fi

      echo "[%F{$context_color}$display_context%F{white}:%F{$namespace_color}$namespace%F{white}]"
    fi
  fi
}

set_prompt() {
  PROMPT="%1~$(get_git_info)$(get_kube_info) %# "
}

add-zsh-hook precmd set_prompt

# =============================================================================
# ALIASES - Git
# =============================================================================

alias g='git'

# =============================================================================
# ALIASES - Kubernetes
# =============================================================================

alias k='kdash'
alias k9='k9s --splashless'
alias kctx="kubectl config current-context"
alias kctxs="kubectl config get-contexts"
alias kmin="kubectl config use-context minikube"

# =============================================================================
# ALIASES - tmux
# =============================================================================

alias dev="~/.tmux/layouts/dev.sh"
alias tmux-reload='tmux source-file ~/.tmux.conf'

# =============================================================================
# LOCAL OVERRIDES
# =============================================================================

# Source local config if it exists (for machine-specific settings)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
alias lzd='lazydocker'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Export AWS default-profile creds into the environment so docker-compose
# (e.g. superpower/devbox) doesn't warn that AWS_ACCESS_KEY_ID is unset.
export AWS_ACCESS_KEY_ID="$(aws configure get aws_access_key_id 2>/dev/null)"
export AWS_SECRET_ACCESS_KEY="$(aws configure get aws_secret_access_key 2>/dev/null)"

# bun completions
[ -s "/private/var/folders/j4/vwyqy4xs7_3b0bstctytzw640000gn/T/tmp.xKQQXmQRxl/bun/_bun" ] && source "/private/var/folders/j4/vwyqy4xs7_3b0bstctytzw640000gn/T/tmp.xKQQXmQRxl/bun/_bun"
