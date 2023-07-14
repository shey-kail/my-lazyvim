# 💤 my-lazyvim

this project is my neovim configs that based on [LazyVim](https://github.com/LazyVim/LazyVim)

## model enabled

lazyvim.plugins.extras.coding.copilot (for copilot)

lazyvim.plugins.extras.dap.core (for debug)

## plugins added

barbar.nvim (to replace bufferline.nvim)

fcitx.nvim

vim-visual-multi (multi-cursor like vscode)

nvim-ufo (fastfold)

vscode.nvim (to replace default theme)

fm-nvim (use ranger, gitui, etc in neovim)

iron.nvim (repl support)

## plugins disabled

alpha-nvim (I don't need and like dashbord)

mini.bufremove (barbar.nvim has this feature)

mini.indentscope (replaced by nvim-treesitter and indent-blankline.nvim)

neo-tree.nvim (replaced by fm-nvim)

catppuccin (replaced by vscode.nvim) (In disabled list, it is called "nvim")

tokyonight.nvim (replaced by vscode.nvim)

nvim-bufferline.lua (replaced by barbar.nvim)

nvim-notify (Too fancy)

nvim-spectre (I don't need find and replace plugins)

## lsp

* pyright

* r_language_server

* lua_ls

* rust-analyzer

## dap

* debugpy

* codelldb(for rust)

## feature

1. lazy load[](./screenshot/lazy_load.png)

2. lsp feature(like completion, rename, syntax checking, etc)

3. treesitter indent promt[](./screenshot/treesitter_indent_promt.png)

4. fastfold(supported by treesitter and nvim-ufo) [](./screenshot/)

