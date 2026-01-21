# =============================================================================
# PATH
# =============================================================================

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.bun/bin:$PATH"

# =============================================================================
# ENVIRONMENT
# =============================================================================

export XDG_CONFIG_HOME="$HOME/.config"

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

      echo "[%F{$context_color}$context%F{white}:%F{$namespace_color}$namespace%F{white}]"
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

alias k='k9s --splashless'
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
