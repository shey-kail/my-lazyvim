-- dap config
return {
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
}
