-- dap config
return {
  { import = "lazyvim.plugins.extras.dap.core" },

  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "codelldb" },
    },
  },
}
