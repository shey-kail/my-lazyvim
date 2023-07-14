return {

  -- lsp configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        bashls = {},
      },
    },
  },

  -- repl
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

            bash = {
              command = "bash",
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
