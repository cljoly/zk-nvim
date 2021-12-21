# zk-nvim
Neovim extension for zk

## Installation

### packer.nvim

```lua
use { "mickael-menu/zk-nvim" }
```

## Configuration

Install and setup [lsp-config](https://github.com/neovim/nvim-lspconfig), then add the following to your Lua Neovim configuration:

```lua
require'lspconfig'.zk.setup()
```
