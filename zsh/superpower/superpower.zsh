# =============================================================================
# SUPERPOWER ZSH CONFIG
# =============================================================================
# Source this file from your .zshrc.local:
#   source ~/repos/dotfiles/zsh/superpower/superpower.zsh

# =============================================================================
# ENVIRONMENT
# =============================================================================

export SUPERPOWER_DIR="${SUPERPOWER_DIR:-$HOME/superpower}"
export PROJECTS_DIR="$SUPERPOWER_DIR"  # For dev.sh compatibility
export GOPRIVATE=github.com/superpowerdotcom/*

# =============================================================================
# ALIASES - Navigation
# =============================================================================

alias sp="cd $SUPERPOWER_DIR"

# =============================================================================
# ALIASES - Kubernetes Context Switching
# =============================================================================

# These require K8S_PRODUCTION_CONTEXT and K8S_STAGING_CONTEXT to be set
# in ~/.zshrc.local (see local.zsh.example)
alias kprd='[ -n "$K8S_PRODUCTION_CONTEXT" ] && kubectl config use-context "$K8S_PRODUCTION_CONTEXT" || echo "K8S_PRODUCTION_CONTEXT not set"'
alias kstg='[ -n "$K8S_STAGING_CONTEXT" ] && kubectl config use-context "$K8S_STAGING_CONTEXT" || echo "K8S_STAGING_CONTEXT not set"'

# =============================================================================
# ALIASES - Tools
# =============================================================================

alias fhir-cli-beta="$SUPERPOWER_DIR/fhir-cli/build/fhir-cli-darwin-arm64"
alias prdappf="~/superpower-scripts/port-forward-prod.sh"
alias gap="~/superpower-scripts/generate-action-plan.sh"
