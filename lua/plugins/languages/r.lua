return {

  -- lsp configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        r_language_server = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "r-languageserver",
      },
    },
  },

  --repl
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")
      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          repl_open_cmd = "rightbelow 40vsplit | set nonu | set norelativenumber | set signcolumn=no ",

          repl_definition = {
            r = {
              command = "radian",
            },
          },
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = false,
      })
    end,
  },
}
