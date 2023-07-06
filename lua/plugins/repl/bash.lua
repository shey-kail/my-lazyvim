return {
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
