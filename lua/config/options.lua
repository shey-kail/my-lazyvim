-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.mouse = "" --禁用鼠标
vim.g.clipboard = "" --禁用系统剪贴板

vim.o.encoding = "utf-8"    -- 保存时的字符编码
vim.o.fileencodings = "ucs-bom,utf-8,cp936"  -- 字符编码

-- set wrap
vim.o.wrap = true
