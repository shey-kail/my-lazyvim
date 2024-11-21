return {

  -- lsp configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        r_language_server = {
          settings = {
            r = {
              lsp = {
                use_stdio = true,
              },
            },
          },
        },
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
        keymaps = {
          visual_send = "<leader><space>",
          send_line = "<leader><space>",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = false,
      })
    end,
  },

  -- preview R variable
  {
    "shey-kail/preview-R-nvim",
    ft = "r",
    dependencies = {
      "hkupty/iron.nvim",
    },
    keys = {
      {
        "<leader>pr",
        mode = { "n", "v" },
        function() require('preview-R-nvim').preview_newbuffer(10) end,
        desc = "preview variable in new buffer"
      },
    },
  }
}
