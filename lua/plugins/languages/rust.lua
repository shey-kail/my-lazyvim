return {
  { import = "lazyvim.plugins.extras.lang.rust" },

  -- dap
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "codelldb" },
    },
  },
}
