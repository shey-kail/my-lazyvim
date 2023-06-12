-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- the function map(mode, lhs, rhs, opts)
-- {mode}  Mode short-name (map command prefix: "n", "i", "v", "x", …) or "!" for |:map!|, or empty string for |:map|.
-- {lhs}   Left-hand-side |{lhs}| of the mapping.
-- {rhs}   Right-hand-side |{rhs}| of the mapping.
-- {opts}  Optional parameters map. Accepts all |:map-arguments| as keys excluding |<buffer>| but including |noremap| and "desc". "desc" can be used to give a description to keymap. When called from Lua, also accepts a "callback" key that takes a Lua function to call when the mapping is executed. Values are Booleans. Unknown key is an error.
local function noremap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- the function map(mode, lhs, rhs, opts)
-- {mode}  Mode short-name (map command prefix: "n", "i", "v", "x", …) or "!" for |:map!|, or empty string for |:map|.
-- {lhs}   Left-hand-side |{lhs}| of the mapping.
-- {rhs}   Right-hand-side |{rhs}| of the mapping.
-- {opts}  Optional parameters map. Accepts all |:map-arguments| as keys excluding |<buffer>| but including |noremap| and "desc". "desc" can be used to give a description to keymap. When called from Lua, also accepts a "callback" key that takes a Lua function to call when the mapping is executed. Values are Booleans. Unknown key is an error.
local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- ===
-- === Remap space as leader key
-- ===
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===
-- === open init.vim file anytime
-- ===
--noremap('n', '<leader>rc', '<cmd>tabedit ~/.config/nvim/init.lua<CR>', {})
-- Quickly edit the configuration
--noremap('n', '<leader>fs', '<cmd>tabedit ~/.config/nvim/lua/plugins.lua<cr>', {})

-- ===
-- === windows management
-- ===
-- use <space> + hjkl for moving the cursor around windows
noremap("n", "<leader>w", "<C-w>w", {})
noremap("n", "<leader>h", "<C-w>h", {})
noremap("n", "<leader>j", "<C-w>j", {})
noremap("n", "<leader>k", "<C-w>k", {})
noremap("n", "<leader>l", "<C-w>l", {})
-- resize splits with arrow keys
noremap("n", "<up>", ":res +5<CR>", {})
noremap("n", "<down>", ":res -5<CR>", {})
noremap("n", "<left>", ":vertical resize-5<CR>", {})
noremap("n", "<right>", ":vertical resize+5<CR>", {})
-- vertical to horizontal ( | -> -- )
noremap("n", "<leader>z", "<C-w>t<C-w>K", {})
noremap("n", "<leader>v", "<C-w>t<C-w>H", {})
--use Ctrl+jk for repaid warching
noremap("n", "<C-j>", "5j", {})
noremap("n", "<C-k>", "5k", {})
--use alt+o to add a new line down
noremap("i", "<A-o>", "<Esc>o", {})
--use alt+O to add a new line up
noremap("i", "<A-O>", "<Esc>O", {})
--use <Esc> to exit terminal-mode
noremap("t", "<Esc>", "<C-\\><C-n>", {})


-- ===
-- ===fm-nvim keymap
-- ===
-- use <space> + ra for opening ranger
noremap("n", "<leader>ra", "<cmd>Ranger<cr>", {})

-- ===
-- ===barbar keymap
-- ===
local bufopts = { noremap = true, silent = true }
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", bufopts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", bufopts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", bufopts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", bufopts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", bufopts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", bufopts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", bufopts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", bufopts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", bufopts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", bufopts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", bufopts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", bufopts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", bufopts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", bufopts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", bufopts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", bufopts)

-- ===
-- === Iron.nvim keymap
-- ===
-- "Iron visual_send"
noremap("v", "<localleader><space>", function()
  require("iron.core").visual_send()
end, bufopts)
-- "Iron send line"
noremap("n", "<localleader><space>", function()
  require("iron.core").send_line()
end, bufopts)
-- "quit Iron"
noremap("n", "<localleader><cr>", function()
  require("iron.core").close_repl()
end, bufopts)
-- "Iron send Enter"
noremap("n", "<localleader><cr>", function()
  require("iron.core").send(nil, string.char(13))
end, bufopts)
-- "Iron interrupt"
noremap("n", "<localleader>s<space>", function()
  require("iron.core").send(nil, string.char(03))
end, bufopts)


-- ===
-- === lsp keymap
-- ===
noremap('n', '<space>rn', vim.lsp.buf.rename, bufopts)

-- ===
-- === <space>m to transfrom mouse enable/disable
-- ===
noremap('n', '<space>m', function()
  if vim.o.mouse=="" then
    vim.o.mouse = "a"
    print("Mouse enabled")
  else
    vim.o.mouse=""
    print("Mouse disabled")
  end
end, bufopts)


