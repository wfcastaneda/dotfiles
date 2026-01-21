# Zsh Configuration

Location: `~/.zshrc`

## Overview

A clean, organized Zsh configuration with a dynamic prompt showing git branch and Kubernetes context, useful aliases, and proper completions setup.

## File Structure

```
zsh/
├── .zshrc                      # Base config (generic, shareable)
└── superpower/
    ├── superpower.zsh          # Superpower-specific aliases
    └── local.zsh.example       # Template for local overrides
```

## Installation

**Option 1: Copy (recommended for customization)**
```bash
cp ~/repos/dotfiles/zsh/.zshrc ~/.zshrc
```

**Option 2: Symlink (tracks upstream changes)**
```bash
ln -sf ~/repos/dotfiles/zsh/.zshrc ~/.zshrc
```

**Set up local overrides:**
```bash
cp ~/repos/dotfiles/zsh/superpower/local.zsh.example ~/.zshrc.local
# Edit ~/.zshrc.local with your K8S context URLs
```

## Prompt

The prompt dynamically shows:
- Current directory (abbreviated)
- Git branch (color-coded: green=feature, red=main/master)
- Kubernetes context and namespace (color-coded by environment)

```
~/repos(feature-branch)[staging-cluster:default] %
```

### Color Coding

| Context | Color |
|---------|-------|
| Feature branch | Green |
| main/master | Red |
| minikube/local | Blue |
| staging k8s | Yellow |
| production k8s | Red |

## Base Config (.zshrc)

The base config includes:

### Environment
- `XDG_CONFIG_HOME`
- NVM setup for Node.js

### Completions
- Docker CLI
- Bun
- Standard Zsh completions

### Aliases

| Alias | Command | Purpose |
|-------|---------|---------|
| `g` | `git` | Short git |
| `k` | `k9s --splashless` | Launch k9s |
| `kctx` | `kubectl config current-context` | Show context |
| `kctxs` | `kubectl config get-contexts` | List contexts |
| `kmin` | `kubectl config use-context minikube` | Switch to minikube |
| `dev` | `~/.tmux/layouts/dev.sh` | Launch dev session |
| `tmux-reload` | `tmux source-file ~/.tmux.conf` | Reload tmux |

## Superpower Config (superpower/superpower.zsh)

Source this from your `~/.zshrc.local` for Superpower-specific settings:

```bash
source ~/repos/dotfiles/zsh/superpower/superpower.zsh
```

Includes:
- `SUPERPOWER_DIR` and `GOPRIVATE` exports
- `sp` alias to cd to superpower
- `kprd`/`kstg` aliases (require K8S context vars)
- Tool aliases (`fhir-cli-beta`, etc.)

## Local Config (~/.zshrc.local)

Create from the example:
```bash
cp ~/repos/dotfiles/zsh/superpower/local.zsh.example ~/.zshrc.local
```

Use this for:
- K8S cluster URLs/ARNs (sensitive, not committed)
- Machine-specific PATH additions
- Personal aliases

Example:
```bash
export K8S_PRODUCTION_CONTEXT="arn:aws:eks:us-east-1:123456:cluster/prod"
export K8S_STAGING_CONTEXT="arn:aws:eks:us-east-1:123456:cluster/staging"
source ~/repos/dotfiles/zsh/superpower/superpower.zsh
```

## Customization

The base `.zshrc` sources `~/.zshrc.local` at the end, so you can override anything or add machine-specific config without modifying the tracked file.
