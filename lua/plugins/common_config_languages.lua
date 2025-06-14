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
    -- opts = {
    --   github = {
    --     -- The template URL to use when downloading assets from github.
    --     -- use kgithub as github mirror site.
    --     download_url_template = "https://kgithub.com/%s/releases/download/%s/%s",
    --   },
    -- },
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  },

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
    ft = { "sh", "py", "r" },
  },

  -- disable <leader><space> for "folke/snacks.nvim"
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader><space>", false, desc = "Find Files (Root Dir)" },
    },
  },

  { import = "plugins.languages" },
}
