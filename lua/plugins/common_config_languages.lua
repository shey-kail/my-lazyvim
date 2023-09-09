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
    opts = {
      github = {
        -- The template URL to use when downloading assets from github.
        -- use kgithub as github mirror site.
        download_url_template = "https://kgithub.com/%s/releases/download/%s/%s",
      },
    },
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
  },

  { import = "plugins.languages" },
}
