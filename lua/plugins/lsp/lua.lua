return {

  -- lsp configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      },
    },
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure pyright, r_language_server, lua_ls, rust_analyzer and kotlin_language_server is installed
      ensure_installed = {
        "lua-language-server",
      },
    },
  },
}
