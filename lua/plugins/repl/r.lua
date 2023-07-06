return {
  {
    "hkupty/iron.nvim",
    config = function()
      require("iron.core").setup({
        config = {
          repl_definition = {
            r = {
              command = "radian",
            },
          },
        },
      })
    end,
  },
}
