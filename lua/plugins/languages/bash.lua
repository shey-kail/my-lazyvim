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
      require("iron.core").setup({
        config = {
          repl_definition = {
            bash = {
              command = "bash",
            },
          },
        },
      })
    end,
  },
}
