# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim with custom plugins and configurations. The setup uses Lazy.nvim for plugin management and follows a modular structure with custom plugins in `lua/custom/plugins/`.

## Key Architecture

### File Structure
- `init.lua` - Main configuration file with core settings, LSP setup, and plugin definitions
- `lua/custom/plugins/` - Custom plugin configurations that extend the base kickstart setup
- `lua/kickstart/` - Standard kickstart plugin modules (gitsigns, etc.)
- `after/queries/` - Tree-sitter query customizations (blade template support)

### Plugin Management
- Uses Lazy.nvim for plugin management
- Custom plugins are loaded via `{ import = 'custom.plugins' }` in init.lua
- Plugin configurations are organized in separate files under `lua/custom/plugins/`

### LSP Configuration
- Language servers: gopls, lua_ls, phpactor, rust_analyzer, tailwindcss, ts_ls, volar
- Auto-installation handled by Mason and mason-lspconfig
- Custom LSP configurations in `lua/custom/plugins/lspconfig.lua`
- Blink.cmp for completion instead of nvim-cmp

## Common Commands

### Plugin Management
- `:Lazy` - Open Lazy plugin manager interface
- `:Lazy update` - Update all plugins
- `:Mason` - Open Mason tool installer interface

### LSP and Development
- `:LspInfo` - Show LSP client information
- `:checkhealth` - Check Neovim configuration health
- `:TSUpdate` - Update Tree-sitter parsers

### Custom Tools
- `:DBUI` - Open database UI interface (vim-dadbod-ui)
- `<leader>R` prefix - Kulala HTTP client commands
- `<C-e>` - Open Harpoon file picker via Telescope

## Important Custom Features

### Theme System
- Uses kanagawa.nvim with automatic light/dark theme switching based on system settings
- Checks system theme every 5 seconds via gsettings (GNOME-specific)
- Falls back to kanagawa-dragon (dark) if system detection fails

### Harpoon 2 Integration
- Quick file navigation with Ctrl+1-4 for first 4 harpooned files
- `<leader>a` to add current file to harpoon
- `<C-e>` opens Telescope picker for harpooned files

### Custom Keymaps
- `<leader>T` - Open new terminal in vertical split
- `<leader>pv` - Open file explorer
- `<leader>yp`/`<leader>yP` - Yank relative/absolute file path
- `<leader>gh` - Browse git history of current file
- `<M-j>`/`<M-k>` - Navigate quickfix list

### Development Tools
- Auto-save with 1.25s debounce
- HTTP client (Kulala) for API testing
- Database UI with completion
- Git integration via fugitive and gitsigns
- Diffview for side-by-side diffs

## Language Support

### Web Development
- TypeScript/JavaScript with ts_ls
- Vue.js with volar and TypeScript plugin integration
- Tailwind CSS with language server
- PHP with phpactor and intelephense
- Blade templates with custom tree-sitter parser

### Other Languages
- Go with gopls
- Rust with rust_analyzer
- Lua with lua_ls (configured for Neovim development)
- Ruby with solargraph

## Testing and Building

No specific test or build commands are configured. This is a Neovim configuration, not a software project. Use standard Neovim health checks:
- `:checkhealth` - Comprehensive health check
- `:checkhealth lazy` - Check plugin manager
- `:checkhealth lsp` - Check LSP configuration

## File Navigation

The configuration heavily emphasizes efficient file navigation:
- Telescope for fuzzy finding (`<leader>sf`, `<leader>sg`, etc.)
- Harpoon for quick file switching
- Git file history via telescope extension
- LSP-based symbol navigation (go-to-definition, references, etc.)