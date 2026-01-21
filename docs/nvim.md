# Neovim Configuration

Location: `~/.config/nvim/init.lua`

## Overview

A modern, single-file Neovim configuration built on **lazy.nvim** plugin manager. Optimized for TypeScript, Go, and React development with AI-assisted coding via Supermaven.

## Core Settings

| Setting | Value | Purpose |
|---------|-------|---------|
| Leader key | `Space` | Prefix for custom keybindings |
| Line numbers | Relative | Easier navigation with vim motions |
| Tab width | 2 spaces | Consistent indentation |
| Clipboard | System | Seamless copy/paste with OS |
| Search | Smart case | Case-insensitive unless uppercase used |

## Plugin Categories

### Appearance
- **github-nvim-theme**: Dark theme matching your terminal aesthetic
- **lualine.nvim**: Status line with git, diagnostics, file info
- **bufferline.nvim**: Visual tab bar for open buffers
- **indent-blankline.nvim**: Vertical indent guides
- **mini.indentscope**: Animated scope highlighting
- **nvim-notify**: Pretty popup notifications
- **dashboard-nvim**: Start screen with quick actions

### Navigation & Search
- **telescope.nvim**: Fuzzy finder for files, grep, symbols
- **neo-tree.nvim**: File explorer with git status
- **flash.nvim**: Jump anywhere on screen with 2-3 keystrokes
- **grug-far.nvim**: Multi-file search and replace

### Code Intelligence
- **nvim-lspconfig**: Language Server Protocol support
- **mason.nvim**: LSP/formatter/linter installer
- **nvim-treesitter**: Advanced syntax highlighting
- **nvim-cmp**: Autocompletion engine
- **supermaven-nvim**: AI code completion

### Editing
- **mini.ai**: Enhanced text objects (functions, arguments, etc.)
- **nvim-surround**: Add/change/delete surrounding pairs
- **nvim-autopairs**: Auto-close brackets and quotes
- **nvim-ts-autotag**: Auto-close HTML/JSX tags
- **Comment.nvim**: Toggle comments with `gc`
- **conform.nvim**: Auto-format on save

### Git
- **gitsigns.nvim**: Git status in gutter, hunk operations
- **diffview.nvim**: Review all changes in a tab view

### Diagnostics
- **trouble.nvim**: Better diagnostics list
- **todo-comments.nvim**: Highlight TODO/FIXME comments

## LSP Servers

Configured via Mason with automatic installation:

| Server | Language |
|--------|----------|
| ts_ls | TypeScript/JavaScript |
| gopls | Go |

## Formatters (conform.nvim)

| Language | Formatter |
|----------|-----------|
| JS/TS/JSON/YAML/HTML/CSS/MD | prettier |
| Go | gofumpt, goimports |
| Lua | stylua |

Formatters run automatically on save. Manual format: `<leader>cf`

## File Structure

Single file configuration for simplicity:
```
~/.config/nvim/
├── init.lua          # Everything lives here
└── lazy-lock.json    # Plugin version lock file
```

## Customization

To add a new plugin, add a table to the `require("lazy").setup({...})` call:

```lua
{
  "author/plugin-name",
  event = "VeryLazy",  -- When to load
  opts = {},           -- Plugin options
},
```

To update plugins: `:Lazy sync`

## Troubleshooting

| Command | Purpose |
|---------|---------|
| `:Lazy` | Plugin manager UI |
| `:Mason` | LSP/formatter installer |
| `:checkhealth` | Diagnose issues |
| `:ConformInfo` | Check formatter status |
| `:LspInfo` | Check LSP status |
