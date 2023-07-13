-- contains lsp configuration, dap configuration, and repl configuration

return {
  -- lsp configuration
  {
    "neovim/nvim-lspconfig",
  },
  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  },

  -- dap config
  { import = "lazyvim.plugins.extras.dap.core" },
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      mappings = {
        -- enable LeftMouse
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
      },
    },
  },

  -- repl config
  {
    "hkupty/iron.nvim",
    ft = { "sh", "py", "lua", "r" },
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          repl_open_cmd = "rightbelow 40vsplit | set nonu | set norelativenumber | set signcolumn=no ",
        },
        -- Iron doesn't set keymaps by default anymore.
        -- Iron.nvim keymaps config is in config/keymaps.lua
        highlight = {
          italic = true,
        },
        ignore_blank_lines = false,
      })
    end,
  },

  { import = "plugins.languages" },
}
